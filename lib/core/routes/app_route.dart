import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neirodev/core/routes/route_names.dart';
import 'package:neirodev/screens/age/age_screen.dart';
import 'package:neirodev/screens/gender/gender_screen.dart';
import 'package:neirodev/screens/nationalize/nationalize_screen.dart';
import 'package:neirodev/screens/neirodev/neirodev.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final _router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/age',
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return Neirodev(child: child);
            },
            routes: [
              GoRoute(
                  path: '/age',
                  name: RouteNames.age,
                  builder: (context, state) => const AgeScreen()
              ),
              GoRoute(
                  path: '/gender',
                  name: RouteNames.gender,
                  builder: (context, state) => const GenderScreen()
              ),
              GoRoute(
                  path: '/nationalize',
                  name: RouteNames.nationalize,
                  builder: (context, state) => const NationalizeScreen()
              ),
            ])
      ]);
}
