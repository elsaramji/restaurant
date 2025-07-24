import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';
import 'package:restaurant/shared/widgets/scondary_button.dart';

class OrderNow extends StatelessWidget {
  const OrderNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/home_welecom.png"),
        Positioned(
          top: 50.h,
          left: 16.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Free Delivery",
                style: AppTextStyles.interBold20().copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                "For all orders over \$20",
                style: AppTextStyles.interRegular16().copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 10.h),
              ScondaryButton(text: "Order Now", onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
