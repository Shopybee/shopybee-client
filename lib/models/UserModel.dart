import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? name;
  final String? phone;
  final String? email;
  final String id;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        id: json['id']);
  }
}
