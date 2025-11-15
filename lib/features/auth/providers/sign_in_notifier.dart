import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';
import 'package:heloilo/features/auth/services/auth_service.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class SignInNotifier extends AsyncNotifier<SignInState> {
  @override
  FutureOr<SignInState> build() {
    return SignInState();
  }

  Future<void> signIn(SignInDto dto) async {
    state = const AsyncValue.loading();

    try {
      // 1. Chama o Serviço de Autenticação
      // 2. Recebe o Token
      final result = await ref.read(authServiceProvider).signin(dto);

      if (result.isFailure) {
        state = AsyncData(SignInState(message: result.error!.message));
        return;
      }

      state = AsyncData(
        SignInState(sucess: true, message: 'Login realizado com sucesso'),
      );

      // 3. SUCESSO! Delega para o "Porteiro" (Global)
      await ref.read(authProvider.notifier).authSucceeded(result.data!);

      // O LoginNotifier nem precisa tirar o loading,
      // porque a tela inteira vai ser substituída pela HomeScreen.
    } catch (e) {
      state = AsyncData(SignInState(sucess: false, message: "Falha no login"));
    }
  }
}

final signInProvider = AsyncNotifierProvider<SignInNotifier, SignInState>(() {
  return SignInNotifier();
});

class SignInState {
  final bool sucess;
  final String message;

  SignInState({this.sucess = false, this.message = ''});

  SignInState copyWith({bool? sucess, String? message}) {
    return SignInState(
      sucess: sucess ?? this.sucess,
      message: message ?? this.message,
    );
  }
}
