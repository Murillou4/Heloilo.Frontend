import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';
import 'package:logger/logger.dart';

final dioProvider = Provider<Dio>((ref) {
  final Logger logger = Logger();

  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL'] ?? '',
      contentType: Headers.jsonContentType,
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      validateStatus: (status) => status != null,
      connectTimeout: const Duration(seconds: 15),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          // Obtém o serviço local de forma assíncrona
          final auth = await ref.read(authProvider.future);

          if (kDebugMode) {
            logger.i(
              'Dio: ${options.path} e token: ${auth?.auth.token ?? "(nulo)"}',
            );
          }

          if (auth != null) {
            options.headers['Authorization'] = 'Bearer ${auth.auth.token}';
          }
        } catch (e, st) {
          if (kDebugMode) {
            logger.i('Erro ao obter token local: $e');
            logger.i(st);
          }
        }

        if (kDebugMode) {
          logger.i('Request Headers: ${options.headers}');
        }

        return handler.next(options);
      },
      onError: (error, handler) {
        if (kDebugMode) {
          logger.i('Dio Error: ${error.message}');
          logger.i('Response: ${error.response}');
        }
        return handler.next(error);
      },
    ),
  );

  return dio;
});
