import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';
import 'package:restaurant/features/auth/presentiton/logic/create_email_with_firebase_auth.dart';
import 'package:restaurant/features/auth/presentiton/logic/login_email_with_firebase_auth.dart';
import 'package:restaurant/shared/logic/validator/validator_functions.dart';
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
              validator: (email) {
                return emailValidator(email);
              },
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              hintText: 'email@example.com',
              obscureText: false,
            ),
            SizedBox(height: 16.h),
            CustomFormFeild(
              controller: passwordController,
              validator: (password) {
                return passwordValidator(password);
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await loginAcountWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context,
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
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      createAcountWithFirebaseAuth(
                        emailController.text,
                        passwordController.text,
                        context,
                      );
                    }
                  },
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
