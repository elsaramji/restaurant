import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/auth/presentiton/views/login_screen.dart';
import 'package:restaurant/features/cart/presentition/views/foodie_cart_view.dart';
import 'package:restaurant/features/home/presentition/view/foodei_home.dart';

final GoRouter router = GoRouter(
  initialLocation: LoginScreen.routeName,
  routes: <GoRoute>[
    GoRoute(
      path: LoginScreen.routeName,
      name: LoginScreen.routeName,
      pageBuilder: (context, state) => _easyTransition(const LoginScreen()),
    ),
    GoRoute(
      path: FoodeiHome.routeName,
      name: FoodeiHome.routeName,
      pageBuilder: (context, state) => _easyTransition(const FoodeiHome()),
    ),
    GoRoute(
      path: FoodieCartView.routeName,
      name: FoodieCartView.routeName,
      pageBuilder: (context, state) => _easyTransition(const FoodieCartView()),
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
