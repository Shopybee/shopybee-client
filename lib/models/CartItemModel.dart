// To parse this JSON data, do
//
//     final cartItemModel = cartItemModelFromMap(jsonString);

import 'dart:convert';

CartItemModel cartItemModelFromMap(String str) =>
    CartItemModel.fromMap(json.decode(str));

String cartItemModelToMap(CartItemModel data) => json.encode(data.toMap());

class CartItemModel {
  CartItemModel({
    required this.productId,
    required this.name,
    required this.mainImage,
    required this.price,
    required this.discount,
  });

  int productId;
  String name;
  String mainImage;
  double price;
  double discount;

  factory CartItemModel.fromMap(Map<String, dynamic> json) => CartItemModel(
        productId: json["productId"],
        name: json["name"],
        mainImage: json["mainImage"],
        price: json["price"],
        discount:json['discount']
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "name": name,
        "mainImage": mainImage,
        "price": price,
      };
}
