import 'package:arman_amin/core/global/app_global.dart';
import 'package:arman_amin/core/router/screen_arguments.dart';
import 'package:arman_amin/features/home/presentation/pages/home_page.dart';
import 'package:arman_amin/features/main/presentation/pages/main_page.dart';
import 'package:arman_amin/features/onlineUsers/presentation/pages/online_users_page.dart';
import 'package:arman_amin/features/result/presentation/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    navigatorKey: AppGlobal.mainKey,
    initialLocation: RouterKey.home,
    routes: [
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return NoTransitionPage(
            child: MainPage(
              child: navigationShell,
            ),
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouterKey.home,
                name: "Home",
                builder: (context, state) {
                  return const HomePage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouterKey.result,
                name: "Result",
                builder: (context, state) {
                  return const ResultPage();
                },
                routes: [
                  GoRoute(
                    path: RouterKey.details,
                    builder: (context, state) {
                      return const Scaffold();
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouterKey.online,
                name: "Online users",
                builder: (context, state) {
                  return const OnlineUserPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return _errorRoute();
    },
  );

  static Widget _errorRoute() {
    return const Scaffold(
      body: Center(
        child: Text("Page not found!"),
      ),
    );
  }

  static ScreenArguments<T> getArgument<T>(BuildContext context) {
    ScreenArguments<T> argument =
        ModalRoute.of(context)!.settings.arguments is ScreenArguments<T>
            ? (ModalRoute.of(context)!.settings.arguments as ScreenArguments<T>)
            : ScreenArguments<T>();
    return argument;
  }
}

class RouterKey {
  static const String home = "/home";
  static const String result = "/result";
  static const String details = "details";
  
  static const String online ="/online";
}
