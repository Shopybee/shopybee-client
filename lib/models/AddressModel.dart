// To parse this JSON data, do
//
//     final addressModel = addressListFromMap(jsonString);

import 'dart:convert';

List<AddressModel> addressListFromMap(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromMap(x)));

String addressModelToMap(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class AddressModel {
  AddressModel({
    required this.name,
    required this.id,
    required this.userId,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.landmark,
    required this.pincode,
    required this.phone,
  });

  int id;
  String name;
  int userId;
  String addressLine;
  String city;
  String state;
  dynamic landmark;
  String pincode;
  String phone;

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        name: json['name'],
        userId: json["userId"],
        addressLine: json["addressLine"],
        city: json["city"],
        state: json["state"],
        landmark: json["landmark"],
        pincode: json["pincode"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "name" : name,
        "addressLine": addressLine,
        "city": city,
        "state": state,
        "landmark": landmark,
        "pincode": pincode,
        "phone": phone,
      };
}
