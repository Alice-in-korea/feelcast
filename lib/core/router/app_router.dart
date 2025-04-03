library;

import 'package:feelcast/presentation/home/home.dart';
import 'package:feelcast/support/common_ui/common_ui.dart';
import 'package:feelcast/support/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter? _router;

  GoRouter get router {
    _router ??= _createRouter();
    return _router!;
  }

  GoRouter _createRouter() => GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: RoutePath.home,
    errorBuilder: _errorPage,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  Widget _errorPage(BuildContext _, GoRouterState __) => ErrorPage();
}
