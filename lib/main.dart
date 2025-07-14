import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'core/constants/app_constants.dart';
import 'core/cubit/locale/locale_cubit.dart';
import 'core/cubit/theme/theme_cubit.dart';
import 'core/utils/app_shared_preferences.dart';
import 'core/routing/app_router.dart';
import 'app.dart';
import 'app_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase asynchronously
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  // Initialize shared preferences asynchronously
  await AppPreferences().init();

  // Initialize service locator
  setup();

  runApp(EasyLocalization(
    supportedLocales: AppConstants.supportedLocales,
    path: 'assets/lang',
    fallbackLocale: const Locale('en'),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: MyApp(appRouter: AppRouter()),
    ),
  ));
}
