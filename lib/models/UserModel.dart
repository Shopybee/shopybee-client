// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
  });

  int? id;
  String email;
  String name;
  String phone;
  String password;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "phone": phone,
        "password" : password,
      };
}
