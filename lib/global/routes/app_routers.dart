import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealther_app/presentation/features/admin_screen/admin_screen.dart';
import 'package:wealther_app/presentation/features/detail_screen/detail_screen.dart';
import 'package:wealther_app/presentation/features/offline_screen/offline_screen.dart';

import '../../presentation/features/home_screen/home_screen.dart';

class AppRouters {
  static var router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomePageScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'offline',
            builder: (BuildContext context, GoRouterState state) {
              return OfflineScreen();
            },
          ),
          GoRoute(
            path: 'detail',
            builder: (BuildContext context, GoRouterState state) {
              return DetailScreen();
            },
          ),
          GoRoute(
            path: 'admin',
            builder: (BuildContext context, GoRouterState state) {
              return AdminScreen();
            },
          ),
        ],
      ),
    ],
  );
}
