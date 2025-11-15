import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';
import 'package:heloilo/features/auth/services/auth_service.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class SignUpNotifier extends AsyncNotifier<SignUpState> {
  @override
  FutureOr<SignUpState> build() {
    return SignUpState();
  }

  Future<void> signIn(SignUpDto dto) async {
    state = const AsyncValue.loading();

    try {
      // 1. Chama o Serviço de Autenticação
      // 2. Recebe o Token
      final result = await ref.read(authServiceProvider).signup(dto);

      if (result.isFailure) {
        state = AsyncData(SignUpState(message: result.error!.message));
        return;
      }

      state = AsyncData(
        SignUpState(sucess: true, message: 'Cadastro realizado com sucesso!'),
      );

      // 3. SUCESSO! Delega para o "Porteiro" (Global)
      await ref.read(authProvider.notifier).authSucceeded(result.data!);

      // O LoginNotifier nem precisa tirar o loading,
      // porque a tela inteira vai ser substituída pela HomeScreen.
    } catch (e) {
      state = AsyncData(
        SignUpState(sucess: false, message: "Falha no cadastro"),
      );
    }
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpNotifier, SignUpState>(() {
  return SignUpNotifier();
});

class SignUpState {
  final bool sucess;
  final String message;

  SignUpState({this.sucess = false, this.message = ''});

  SignUpState copyWith({bool? sucess, String? message}) {
    return SignUpState(
      sucess: sucess ?? this.sucess,
      message: message ?? this.message,
    );
  }
}
