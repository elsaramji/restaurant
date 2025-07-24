import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/features/home/data/repos/prodcute_repos.dart';
import 'package:restaurant/features/home/presentition/widgets/foodie_item_card.dart';

class FoodieList extends StatelessWidget {
  const FoodieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: FoodItemCard(fastFoodModel: fastFoods[index], inCart: false),
        ),
        childCount: fastFoods.length,
      ),
    );
  }
}
