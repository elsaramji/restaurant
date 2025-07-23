import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';

class FoodiesWelcomeMassage extends StatelessWidget {
  const FoodiesWelcomeMassage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        SizedBox(height: 83.h),
        Image.asset(
          "assets/icons/foodies_icon.png",
          width: 96.w,
          height: 96.h,
          fit: BoxFit.fill,
        ),

        Text(
          "FoodieApp",
          style: AppTextStyles.interBold30().copyWith(color: AppColors.white),
        ),

        Text(
          "Delicious food at your fingertips",
          style: AppTextStyles.interRegular16().copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
