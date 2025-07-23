import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';

/// A custom primary button widget that can be used throughout the application.
/// It is a stateless widget that takes an optional callback function and a text string.
/// This button is styled with a rounded rectangle shape, a minimum size, and a primary color background.
/// /// The button's text is displayed in a semibold style with a white color.
class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const PrimaryButton({this.onPressed, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(AppColors.secondaryfillred),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity.w, 60.h)),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
      ),
      child: Text(
        text,
        style: AppTextStyles.interSemiBold18().copyWith(color: AppColors.white),
      ),
    );
  }
}
