import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? title;
  final String? phone;
  final String? email;
  final String id;

  UserModel({
    required this.title,
    required this.phone,
    required this.email,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        title: json['title'],
        phone: json['phone'],
        email: json['email'],
        id: json['id']);
  }
}
