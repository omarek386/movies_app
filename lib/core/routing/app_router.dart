import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/presentation/pages/auth_home_page.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../routing/routes.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _createRoute(const SplashScreen());
      case Routes.onBoardingScreen:
        return _createRoute(const OnboardingScreen());
      case Routes.authHomeScreen:
        return _createRoute(const AuthHomeScreen());
      case Routes.loginScreen:
        return _createRoute(const LoginScreen());
      case Routes.signupScreen:
        return _createRoute(const SignUpScreen());

      default:
        return null;
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
