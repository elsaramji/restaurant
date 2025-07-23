import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBackGroundLinear extends StatelessWidget {
  const LoginBackGroundLinear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 1.sw,
      height: 1.sh,
      "assets/images/background_linear.png",
      fit: BoxFit.fill,
      filterQuality: FilterQuality.high,
    );
  }
}