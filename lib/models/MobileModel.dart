// To parse this JSON data, do
//
//     final mobileModel = mobileModelFromMap(jsonString);

import 'dart:convert';

List<MobileModel> mobileModelFromMap(String str) => List<MobileModel>.from(json.decode(str).map((x) => MobileModel.fromMap(x)));

String mobileModelToMap(List<MobileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class MobileModel {
  MobileModel({
    required this.id,
    required this.brandId,
    required this.name,
    required this.mainImage,
    required this.description,
    required this.ram,
    required this.price,
    required this.storage,
    required this.brand,
    required this.batteryDetail,
    required this.batteryBackup,
    required this.quantity,
    required this.warranty,
    required this.discount,
    required this.operatingSystem,
    required this.processor,
    required this.display,
    required this.type,
    required this.simCardSlot,
    required this.frontCamera,
    required this.rearCamera,
    required this.itemsInBox,
    required this.images,
  });

  int id;
  int brandId;
  String name;
  String mainImage;
  String description;
  int ram;
  double price;
  int storage;
  String brand;
  String batteryDetail;
  int batteryBackup;
  int quantity;
  int warranty;
  double discount;
  String operatingSystem;
  String processor;
  String display;
  String type;
  String simCardSlot;
  int frontCamera;
  int rearCamera;
  String itemsInBox;
  String images;

  factory MobileModel.fromMap(Map<String, dynamic> json) => MobileModel(
    id: json["id"],
    brandId: json["brandId"],
    name: json["name"],
    mainImage: json["mainImage"],
    description: json["description"],
    ram: json["ram"],
    price: json["price"],
    storage: json["storage"],
    brand: json["brand"],
    batteryDetail: json["batteryDetail"],
    batteryBackup: json["batteryBackup"],
    quantity: json["quantity"],
    warranty: json["warranty"],
    discount: json["discount"],
    operatingSystem: json["operatingSystem"],
    processor: json["processor"],
    display: json["display"],
    type: json["type"],
    simCardSlot: json["simCardSlot"],
    frontCamera: json["frontCamera"],
    rearCamera: json["rearCamera"],
    itemsInBox: json["itemsInBox"],
    images: json["images"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "brandId": brandId,
    "name": name,
    "mainImage": mainImage,
    "description": description,
    "ram": ram,
    "price": price,
    "storage": storage,
    "brand": brand,
    "batteryDetail": batteryDetail,
    "batteryBackup": batteryBackup,
    "quantity": quantity,
    "warranty": warranty,
    "discount": discount,
    "operatingSystem": operatingSystem,
    "processor": processor,
    "display": display,
    "type": type,
    "simCardSlot": simCardSlot,
    "frontCamera": frontCamera,
    "rearCamera": rearCamera,
    "itemsInBox": itemsInBox,
    "images": images,
  };
}
