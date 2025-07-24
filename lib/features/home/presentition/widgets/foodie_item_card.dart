import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/config/colors.dart';
import 'package:restaurant/config/texts_styles.dart';
import 'package:restaurant/features/cart/data/repos/cart_items_repo.dart';
import 'package:restaurant/features/cart/presentition/views/foodie_cart_view.dart';
import 'package:restaurant/features/home/data/models/fast_food_model.dart';

class FoodItemCard extends StatefulWidget {
  final FastFoodModel fastFoodModel;
  final bool inCart;
  const FoodItemCard({
    required this.fastFoodModel,
    super.key,
    required this.inCart,
  });

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.network(
              width: 64.w,
              height: 64.h,
              fit: BoxFit.contain,
              widget.fastFoodModel.image,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.fastFoodModel.name,
                style: AppTextStyles.interBold16().copyWith(
                  color: AppColors.primaryText,
                ),
              ),
              Text(
                "\$${widget.fastFoodModel.price}",
                style: AppTextStyles.interSemiBold14().copyWith(
                  color: AppColors.secondarysubText,
                ),
              ),
            ],
          ),
          Spacer(),
          Visibility(
            visible: !widget.inCart,
            child: IconButton(
              onPressed: () {
                CartItemsRepo.cartItems.add(widget.fastFoodModel);
                context.pushNamed(FoodieCartView.routeName);
                log(CartItemsRepo.cartItems.length.toString());
              },
              icon: const Icon(Icons.add, color: AppColors.white),
              style: TextButton.styleFrom(backgroundColor: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
