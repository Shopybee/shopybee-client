// To parse this JSON data, do
//
//     final cartModel = cartModelFromMap(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromMap(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromMap(x)));

String cartModelToMap(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CartModel {
  CartModel({
    required this.cartId,
    required this.userId,
    required this.categoryId,
    required this.brandId,
    required this.productId,
    required this.quantity,
  });

  int cartId;
  int userId;
  int categoryId;
  int brandId;
  int productId;
  int quantity;

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
        cartId: json["cartId"],
        userId: json["userId"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "categoryId": categoryId,
        "brandId": brandId,
        "productId": productId,
        "quantity": quantity,
      };
}
