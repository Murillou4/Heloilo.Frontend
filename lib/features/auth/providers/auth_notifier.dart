import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/core/constants/local_data_keys.dart';
import 'package:heloilo/core/services/local_data_service.dart';
import 'package:heloilo/data/models/auth.dart';
import 'package:heloilo/data/models/user.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class AuthNotifier extends AsyncNotifier<AuthState?> {
  @override
  FutureOr<AuthState?> build() async {
    state = const AsyncLoading();

    await Future.delayed(const Duration(seconds: 5));

    final tokenData = await LocalDataService.readSecure(LocalDataKeys.token);

    if (tokenData == null) return null;

    return AuthState(auth: Auth.fromJson(tokenData));
  }

  Future<void> authSucceeded(AuthResponseDto dto) async {
    state = AsyncValue.data(AuthState(auth: dto.auth, user: dto.user));
  }

  Future<void> logout() async {
    await LocalDataService.deleteSecure('token');
    state = AsyncValue.data(null);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState?>(
  () => AuthNotifier(),
);

class AuthState {
  final Auth auth;
  final User? user;
  AuthState({required this.auth, this.user});
}
