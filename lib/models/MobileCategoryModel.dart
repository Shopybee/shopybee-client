// To parse this JSON data, do
//
//     final mobileCategoryModel = mobileCategoryModelFromMap(jsonString);

import 'dart:convert';

List<MobileCategoryModel> mobileCategoryModelFromMap(String str) =>
    List<MobileCategoryModel>.from(
        json.decode(str).map((x) => MobileCategoryModel.fromMap(x)));

String mobileCategoryModelToMap(List<MobileCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MobileCategoryModel {
  MobileCategoryModel({
    required this.name,
    required this.brandId,
    required this.categoryId,
    required this.logo,
  });
  int brandId;
  String name;
  int categoryId;
  String logo;

  factory MobileCategoryModel.fromMap(Map<String, dynamic> json) =>
      MobileCategoryModel(
        name: json["name"],
        categoryId: json["categoryId"],
        logo: json["logo"],
        brandId: json['brandId'],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "categoryId": categoryId,
        "logo": logo,
      };
}
