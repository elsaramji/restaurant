import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/auth/views/login_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: LoginScreen.routeName,
  routes: <GoRoute>[
    GoRoute(
      path: LoginScreen.routeName,
      name: LoginScreen.routeName,
      pageBuilder: (context, state) => _easyTransition(const LoginScreen()),
    ),
  ],
);

CustomTransitionPage _easyTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final opacityAnimation = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation);

      return FadeTransition(
        opacity: opacityAnimation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1).animate(animation),
          child: child,
        ),
      );
    },
  );
}
