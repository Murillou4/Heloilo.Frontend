import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:heloilo/core/constants/local_data_keys.dart';
import 'package:heloilo/core/services/local_data_service.dart';
import 'package:heloilo/core/themes/app_colors.dart';
import 'package:heloilo/features/auth/pages/sign_up_page.dart';
import 'package:heloilo/features/onboarding/widgets/onboarding_view.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/onboarding';

  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Salva o flag de onboarding e navega para a tela de login/cadastro
  Future<void> _onOnboardingComplete() async {
    await LocalDataService.setBool(LocalDataKeys.onboardingComplete, true);
    // Navega para a tela de cadastro ou login
    // O router vai agora te direcionar corretamente
    if (mounted) {
      context.go(SignUpPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.textTheme;
    final colors = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Seção do PageView
            Expanded(
              flex: 3,
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnboardingView(
                    icon: '💖',
                    title: 'Bem-vindos ao Heloilo',
                    subtitle:
                        'O seu universo particular. Um espaço seguro e íntimo, criado exclusivamente para vocês dois celebrarem o amor.',
                  ),
                  OnboardingView(
                    icon: '✨',
                    title: 'Registrem, Sonhem, Conectem-se',
                    subtitle:
                        'Guardem Memórias, compartilhem Desejos e acompanhem o dia a dia um do outro com o diário de Humor.',
                  ),
                  OnboardingView(
                    icon: '🔗',
                    title: 'Um App Feito para Dois',
                    subtitle:
                        'O Heloilo só funciona quando o casal está conectado. Crie sua conta e envie um convite para o seu amor.',
                  ),
                ],
              ),
            ),

            // Seção dos Controles (Indicador e Botões)
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Indicador de página (bolinhas)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final isActive = _currentPage == index;
                        final isDark = theme.brightness == Brightness.dark;

                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          height: 8.0,
                          width: isActive ? 24.0 : 8.0,
                          decoration: BoxDecoration(
                            color: isActive
                                ? (isDark
                                      ? AppColors.primaryDark
                                      : AppColors.primaryLight)
                                : (isDark
                                      ? AppColors.borderDark.withValues(
                                          alpha: 0.4,
                                        )
                                      : AppColors.borderLight.withValues(
                                          alpha: 0.4,
                                        )),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        );
                      }),
                    ),

                    // Botões
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Botão Pular
                        AnimatedOpacity(
                          opacity: _currentPage < 2 ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: TextButton(
                            onPressed: _currentPage < 2
                                ? _onOnboardingComplete
                                : null,
                            child: const Text('Pular'),
                          ),
                        ),

                        // Botão Próximo / Finalizar
                        FilledButton(
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                              vertical: 16.0,
                            ),
                          ),
                          onPressed: () {
                            if (_currentPage < 2) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _onOnboardingComplete();
                            }
                          },
                          child: Text(
                            _currentPage < 2 ? 'Próximo' : 'Vamos Começar!',
                            style: textStyles.titleMedium?.copyWith(
                              color: colors.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
