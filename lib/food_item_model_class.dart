// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FoodItem {
  String itemImagePath;
  String itemName;
  String estimateTime;
  double rating;
  FoodItem(
      {required this.itemImagePath,
      required this.itemName,
      this.estimateTime = "15-30 min , Fast Food ",
      this.rating = 4.4});

  FoodItem copyWith({
    String? itemImagePath,
    String? itemName,
  }) {
    return FoodItem(
      itemImagePath: itemImagePath ?? this.itemImagePath,
      itemName: itemName ?? this.itemName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemImagePath': itemImagePath,
      'itemName': itemName,
    };
  }

  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      itemImagePath: map['itemImagePath'] as String,
      itemName: map['itemName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodItem.fromJson(String source) =>
      FoodItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FoodItem(itemImagePath: $itemImagePath, itemName: $itemName)';

  @override
  bool operator ==(covariant FoodItem other) {
    if (identical(this, other)) return true;

    return other.itemImagePath == itemImagePath && other.itemName == itemName;
  }

  @override
  int get hashCode => itemImagePath.hashCode ^ itemName.hashCode;
}
