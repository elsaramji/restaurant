import 'package:flutter/material.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';

showErrorMassage(BuildContext context, {required String message}) {
  return showDialog(
    context: context,

    builder: (context) => AlertDialog(
      content: Text(
        message,
        style: AppTextStyles.interRegular12().copyWith(
          color: AppColors.primary,
        ),
      ),
    ),
  );
}
