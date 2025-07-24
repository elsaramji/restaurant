import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';

/// A custom primary button widget that can be used throughout the application.
/// It is a stateless widget that takes an optional callback function and a text string.
/// This button is styled with a rounded rectangle shape, a minimum size, and a primary color background.
/// /// The button's text is displayed in a semibold style with a white color.
class ScondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const ScondaryButton({this.onPressed, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(AppColors.secondaryfillred),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        ),

        backgroundColor: WidgetStatePropertyAll(AppColors.white),
      ),
      child: Text(
        text,
        style: AppTextStyles.interRegular16().copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
