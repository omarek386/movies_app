import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/pages/auth_home_page.dart';
import 'package:movies_app/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:movies_app/features/weather/presentation/pages/home_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/weather/presentation/pages/search_screen.dart';
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
        return _createRoute(BlocProvider(
          create: (context) => AuthCubit(sl(), sl(), sl(), sl()),
          child: const LoginScreen(),
        ));
      case Routes.signupScreen:
        return _createRoute(BlocProvider(
          create: (context) => AuthCubit(sl(), sl(), sl(), sl()),
          child: const SignUpScreen(),
        ));
      case Routes.homeScreen:
        final location = settings.arguments as String?;
        return _createRoute(BlocProvider(
          create: (context) => WeatherCubit(sl(), sl()),
          child: HomeScreen(
            location: location,
          ),
        ));
      case Routes.searchScreen:
        return _createRoute(BlocProvider(
          create: (context) => WeatherCubit(sl(), sl()),
          child: const SearchScreen(),
        ));

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No route defined ${settings.name} ${FirebaseAuth.instance.currentUser?.displayName},',
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ),
        );
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
