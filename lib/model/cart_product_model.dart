import 'package:flutter/material.dart';
import 'package:summer1/helper/extenstion.dart';

class CartProductModel {
  late String name, image, price;
  late int quantity;
  String? productId;

  // Make this optional by using nullable type `String?`

  CartProductModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.quantity,
      this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    price = map['price'];
    image = map['image'];
    quantity = map['quantity'];
    productId = map['productId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
      'productId': productId,
    };
  }
}
