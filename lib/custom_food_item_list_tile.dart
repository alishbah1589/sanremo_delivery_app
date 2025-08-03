import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/food_item_model_class.dart';

class CustomFoodItemListTile extends StatelessWidget {
  final FoodItem foodItem;

  const CustomFoodItemListTile({super.key, required this.foodItem});
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                  width: 0.5, color: const Color.fromARGB(255, 58, 56, 56)),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  foodItem.itemImagePath,
                ),
              )),
          child: InkWell(
            onTap: () {},
            focusColor: Colors.pinkAccent,
            hoverColor: const Color.fromARGB(255, 80, 76, 78),
          )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(foodItem.itemName,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        ),
      ),
    ]);
  }
}

class ExploreRestaurantListTile extends StatelessWidget {
  ExploreRestaurantListTile({super.key, required this.foodItem});
  FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.all(16),
      elevation: 10,
      child: ListTile(
        minTileHeight: 150,
        onTap: () {
          //navigation
        },
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              focusColor: const Color.fromARGB(255, 236, 151, 179),
              hoverColor: const Color.fromARGB(255, 88, 84, 86),
              child: Image.network(
                foodItem.itemImagePath,
                fit: BoxFit.contain,
                height: 100,
              ),
            ),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(foodItem.itemName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                )),
            Text(foodItem.estimateTime,
                style:
                    const TextStyle(fontWeight: FontWeight.w200, fontSize: 12))
          ],
        ),
      ),
    );
  }
}
