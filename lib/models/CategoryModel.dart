// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromMap(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromMap(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromMap(x)));

String categoryModelToMap(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.image,
  });

  int categoryId;
  String name;
  String image;

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["categoryId"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
      };
}
