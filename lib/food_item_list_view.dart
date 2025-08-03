import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/custom_food_item_list_tile.dart';
import 'package:sanremo_food_delivery/food_item_model_class.dart';

class FoodItemListView extends StatelessWidget {
  final List<FoodItem> foodItem;
  const FoodItemListView({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CustomFoodItemListTile(
        foodItem: foodItem[index],
      ),
      itemCount: foodItem.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 5, right: 5),
    );
  }
}

class ExploreResturantListView extends StatelessWidget {
  final List<FoodItem> exploreItem;

  const ExploreResturantListView({super.key, required this.exploreItem});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ExploreRestaurantListTile(
        foodItem: exploreItem[index],
      ),
      itemCount: exploreItem.length,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
    );
  }
}
