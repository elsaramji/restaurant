import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';
import 'package:restaurant/features/cart/data/repos/cart_items_repo.dart';
import 'package:restaurant/features/home/presentition/widgets/foodie_item_card.dart';
import 'package:restaurant/shared/widgets/custom_primary_button.dart';

class FoodieCartView extends StatelessWidget {
  static const routeName = '/cart';
  const FoodieCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Foodie Cart',
          style: AppTextStyles.interBold24().copyWith(color: AppColors.primary),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: FoodItemCard(
                fastFoodModel: CartItemsRepo.cartItems[index],
                inCart: true,
              ),
            ),
            itemCount: CartItemsRepo.cartItems.length,
          ),
          SliverToBoxAdapter(
            child: Visibility(
              visible: CartItemsRepo.cartItems.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: PrimaryButton(
                  text: "Proceed to Checkout",
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
