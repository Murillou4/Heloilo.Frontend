import 'package:heloilo/features/auth/pages/loading_page.dart';
import 'package:heloilo/features/auth/pages/sign_in_page.dart';
import 'package:heloilo/features/auth/pages/sign_up_page.dart';
import 'package:heloilo/features/onboarding/pages/onboarding_page.dart';

bool isPublicRoute(String routeName) {
  final List<String> publicRoutes = [
    SignInPage.routeName,
    SignUpPage.routeName,
    LoadingPage.routeName,
    OnboardingPage.routeName,
  ];

  return publicRoutes.contains(routeName);
}
