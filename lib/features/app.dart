import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heloilo/core/constants/local_data_keys.dart';
import 'package:heloilo/core/constants/public_routes.dart';
import 'package:heloilo/core/services/local_data_service.dart';
import 'package:heloilo/core/themes/dark_theme.dart';
import 'package:heloilo/core/themes/light_theme.dart';
import 'package:heloilo/core/themes/theme_notifier.dart';
import 'package:heloilo/features/auth/pages/loading_page.dart';
import 'package:heloilo/features/auth/pages/sign_in_page.dart';
import 'package:heloilo/features/auth/pages/sign_up_page.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';
import 'package:heloilo/features/onboarding/pages/onboarding_page.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);

    final router = ref.watch(_routerProvider);

    return MaterialApp.router(
      routerConfig: router,

      themeMode: themeNotifier,
      theme: themeLight,
      darkTheme: themeDark,
    );
  }
}

final _routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    redirect: (context, state) {
      // 1. Lógica de Onboarding
      // Lê o valor síncrono do SharedPreferences
      final bool onboardingComplete =
          LocalDataService.getBool(LocalDataKeys.onboardingComplete) ?? false;
      final String currentLocation = state.path ?? '';

      if (!onboardingComplete) {
        // Se não completou o onboarding, force-o para a tela de onboarding
        // A menos que ele JÁ esteja lá
        return (currentLocation == OnboardingPage.routeName)
            ? null
            : OnboardingPage.routeName;
      }

      // 2. Lógica de Autenticação (Se o onboarding ESTIVER completo)

      // Se o onboarding está completo e o usuário tentar
      // voltar para /onboarding, redirecione-o.
      if (currentLocation == OnboardingPage.routeName) {
        return LoadingPage.routeName; // Rota de entrada padrão
      }

      if (authState.isLoading) {
        return LoadingPage.routeName;
      }

      if (isPublicRoute(state.path ?? "")) return null;

      final isAuthenticated = authState.value != null;

      if (!isAuthenticated) return SignInPage.routeName;

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: OnboardingPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: LoadingPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const LoadingPage();
        },
      ),
      GoRoute(
        path: SignInPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: SignUpPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpPage();
        },
      ),
    ],
  );
});
