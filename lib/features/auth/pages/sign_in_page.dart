import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heloilo/core/shared/widgets/custom_button.dart';
import 'package:heloilo/core/shared/widgets/custom_textfield.dart';
import 'package:heloilo/features/auth/pages/sign_up_page.dart';
import 'package:heloilo/features/auth/providers/sign_in_notifier.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class SignInPage extends ConsumerStatefulWidget {
  static const routeName = '/sign-in';
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final dto = SignInDto(
      email: _emailController.text,
      password: _passwordController.text,
    );

    await ref.read(signInProvider.notifier).signIn(dto);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final signInState = ref.watch(signInProvider);
    final isLoading = signInState.isLoading;

    // Listener para exibir erros do provider
    ref.listen<AsyncValue<SignInState>>(signInProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: colorScheme.error,
          ),
        );
      } else if (next.hasValue &&
          !next.value!.sucess &&
          next.value!.message.isNotEmpty) {
        // Exibe mensagens de falha (ex: "Email ou senha inválidos")
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.value!.message),
            backgroundColor: colorScheme.error,
          ),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // --- Cabeçalho ---
                    Icon(
                      Icons.favorite_border, // Ícone romântico
                      color: theme.primaryColor,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Bem-vindo(a) de volta!',
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sentimos sua falta. Faça login para continuar.',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(
                        color: textTheme.bodyMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // --- Campo de Email ---
                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      hintText: 'seuemail@exemplo.com',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira seu email';
                        }
                        if (!value.contains('@')) {
                          return 'Por favor, insira um email válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // --- Campo de Senha ---
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Senha',
                      hintText: 'Sua senha',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira sua senha';
                        }
                        if (value.length < 6) {
                          return 'A senha deve ter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    // --- Esqueci minha senha ---
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Implementar fluxo de "Esqueci minha senha"
                        },
                        child: const Text('Esqueci minha senha'),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // --- Botão de Login ---
                    CustomButton(
                      text: 'Entrar',
                      onPressed: _submitLogin,
                      isLoading: isLoading,
                    ),
                    const SizedBox(height: 24),

                    // --- Link de Cadastro ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Não tem uma conta?', style: textTheme.bodyMedium),
                        TextButton(
                          onPressed: () {
                            // Navega para a tela de cadastro
                            context.push(SignUpPage.routeName);
                          },
                          child: const Text('Cadastre-se'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
