import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';

class CustomFormFeild extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefix;

  const CustomFormFeild({
    super.key,
    this.controller,
    required this.textInputAction,
    required this.textInputType,
    this.validator,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      textInputAction: TextInputAction.done,
      controller: controller,
      validator: validator,
      obscureText: obscureText,

      cursorColor: AppColors.primary,
      style: AppTextStyles.interMedium14().copyWith(
        color: AppColors.primaryText,
        letterSpacing: 0,
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
        prefixIcon: prefix,
        filled: true,
        fillColor: AppColors.secondaryform,
        isDense: true,
        hintText: hintText,
        suffixIcon: suffixIcon,

        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        hintStyle: AppTextStyles.interMedium14().copyWith(
          color: AppColors.secondaryText,
          decoration: TextDecoration.none,
          letterSpacing: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.stroke, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.secondaryfillred, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.secondaryfillred, width: 1.w),
        ),
      ),
    );
  }
}
