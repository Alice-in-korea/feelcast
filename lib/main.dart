import 'dart:async';

import 'package:feelcast/core/router/router.dart';
import 'package:feelcast/core/config/config.dart';
import 'package:feelcast/presentation/connectivity/connectivity.dart';
import 'package:feelcast/presentation/theme_switcher/theme_switcher.dart';
import 'package:feelcast/presentation/weather/weather.dart';
import 'package:feelcast/repository/repository.dart';
import 'package:feelcast/support/style/style.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager/workmanager.dart';
import 'presentation/location/location.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      /// isar
      await LocalDBIsar.instance.initLocalDB();

      /// workmanager for main isolate
      await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

      runApp(const MainApp());
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LocationCubit(SecureStorageUtils.instance),
          ),
          BlocProvider(create: (context) => ThemeSwitcherCubit()),
          BlocProvider(
            create:
                (context) => WeatherCubit(
                  repository: WeatherRepository(),
                  localDB: LocalDBIsar.instance,
                ),
          ),
          BlocProvider(
            create:
                (context) => ForecastCubit(
                  repository: WeatherRepository(),
                  localDB: LocalDBIsar.instance,
                ),
          ),
          BlocProvider(create: (context) => ConnectivityCubit()),
        ],
        child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: AppRouter().router,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
