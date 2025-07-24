import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/features/auth/presentiton/widgets/auth_form.dart';
import 'package:restaurant/features/auth/presentiton/widgets/foodies_welcome_massage.dart';
import 'package:restaurant/features/auth/presentiton/widgets/login_background_linear.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginscreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackGroundLinear(),
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(flex: 2, child: FoodiesWelcomeMassage()),
                      SizedBox(height: 32.h),
                      Expanded(flex: 3, child: AuthForm()),
                      SizedBox(height: 83.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
