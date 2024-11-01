import 'package:flutter/material.dart';
import 'package:summer1/helper/extenstion.dart';

class ProductModel {
  late String name, image, description, price;
  String? sized;
  Color? color;
  String? productId;
  // Make this optional by using nullable type `String?`

  ProductModel({
    required this.name,
    this.color,
    required this.description,
    required this.image,
    required this.price,
    this.sized, // Now `sized` is optional
    this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    price = map['price'];
    color = HexColor.fromHex(map['color']);
    description = map['description'];
    image = map['image'];
    sized = map['sized'];
    productId = map['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'color': color,
      'description': description,
      'image': image,
      'sized': sized,
      'productId': productId
    };
  }
}
