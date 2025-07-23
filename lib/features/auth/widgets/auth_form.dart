import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';
import 'package:restaurant/shared/widgets/custom_primary_button.dart';
import 'package:restaurant/shared/widgets/text_form_filed.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: Text("Welcome Back", style: AppTextStyles.interBold24()),
            ),

            CustomFormFeild(
              controller: emailController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              hintText: 'email@example.com',
              obscureText: false,
            ),
            SizedBox(height: 16.h),
            CustomFormFeild(
              controller: passwordController,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              hintText: 'password',
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: PrimaryButton(
                text: "Login",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log(
                      "email: ${emailController.text} password: ${passwordController.text}",
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: AppTextStyles.interRegular14().copyWith(
                    color: AppColors.primaryText,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Sign up",
                    style: AppTextStyles.interSemiBold14().copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
