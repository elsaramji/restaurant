import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';
import 'package:restaurant/features/cart/data/repos/cart_items_repo.dart';
import 'package:restaurant/features/cart/presentition/views/foodie_cart_view.dart';
import 'package:restaurant/features/home/presentition/widgets/food_list.dart';
import 'package:restaurant/features/home/presentition/widgets/order_now.dart';

class FoodeiHome extends StatefulWidget {
  static const routeName = '/home';

  const FoodeiHome({super.key});

  @override
  State<FoodeiHome> createState() => _FoodeiHomeState();
}

class _FoodeiHomeState extends State<FoodeiHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,

        title: Text(
          "Foodei",
          style: AppTextStyles.interBold24().copyWith(color: AppColors.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(FoodieCartView.routeName);
            },
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,

                  child: CircleAvatar(
                    backgroundColor: AppColors.secondaryfillred,
                    radius: 8.r,
                    child: Text(
                      CartItemsRepo.cartItems.length.toString(),
                      style: AppTextStyles.interRegular10().copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                child: OrderNow(),
              ),
            ),
            FoodieList(),
          ],
        ),
      ),
    );
  }
}
