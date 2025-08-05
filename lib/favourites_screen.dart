import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/custom_food_item_list_tile.dart';
import 'package:sanremo_food_delivery/favourites_manager.dart';
import 'package:sanremo_food_delivery/food_item_model_class.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Favourites',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade600,
              ),
            ),
          ),

          // Favourite items list
          Expanded(
            child: ValueListenableBuilder<List<FoodItem>>(
              valueListenable: FavouritesManager.favouriteItemsNotifier,
              builder: (context, favouriteItems, _) {
                if (favouriteItems.isEmpty) {
                  return const Center(
                    child: Text(
                      "No favorites yet!",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: favouriteItems.length,
                  itemBuilder: (context, index) {
                    final item = favouriteItems[index];
                    return ExploreRestaurantListTile(foodItem: item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
