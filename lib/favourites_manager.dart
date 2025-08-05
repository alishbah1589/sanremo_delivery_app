import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/food_item_model_class.dart';
import 'package:sanremo_food_delivery/list_food_items.dart';

class FavouritesManager {
  static final ValueNotifier<List<FoodItem>> favouriteItemsNotifier = ValueNotifier<List<FoodItem>>([]);
  static List<FoodItem> get favouriteItems => favouriteItemsNotifier.value;


  static void addToFavorites(FoodItem item){
    if (!favouriteItemsNotifier.value.contains(item)) {
      favouriteItemsNotifier.value = [... favouriteItemsNotifier.value , item];
    
      }
    }
    static void removeFromFavorites(FoodItem item){
      favouriteItemsNotifier.value = favouriteItemsNotifier.value 
      .where((element) => element !=item). toList();
  
  }
   static bool isFavourite (FoodItem item){
    return favouriteItemsNotifier.value.contains(item);
   }
}

