import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/core/services/dio_service.dart';
import 'package:heloilo/core/services/local_data_service.dart';
import 'package:heloilo/core/shared/models/api_response.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<Result<AuthResponseDto>> signin(SignInDto dto) async {
    final response = await _dio.post('/auth/login', data: dto.toMap());

    final apiResponse = ApiResponse.fromMap(response.data).toOkorError();

    if (apiResponse is ApiResponseSuccess) {
      final authDto = AuthResponseDto.fromResponse(apiResponse.data!);

      await LocalDataService.writeSecure('token', authDto.auth.token);

      return Success(authDto);
    }

    return Failure(
      AppFailure(apiResponse.message, apiResponse.extendedResultCode),
    );
  }

  Future<Result<AuthResponseDto>> signup(SignUpDto dto) async {
    final response = await _dio.post('/auth/register', data: dto.toMap());

    final apiResponse = ApiResponse.fromMap(response.data).toOkorError();

    if (apiResponse is ApiResponseSuccess) {
      final authDto = AuthResponseDto.fromResponse(apiResponse.data!);

      await LocalDataService.writeSecure('token', authDto.auth.token);

      return Success(authDto);
    }

    return Failure(
      AppFailure(apiResponse.message, apiResponse.extendedResultCode),
    );
  }

  // outros métodos, como logout, refresh token, etc.
}

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio);
});
