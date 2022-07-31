import 'package:flutter/material.dart';
import 'package:shopybee/models/CategoryModel.dart';
import 'package:shopybee/view/Screens/CartScreen/cart_screen.dart';
import 'package:shopybee/view/Screens/CategoryScreen/category_screen.dart';
import 'package:shopybee/view/Screens/HomeScreen/home_screen.dart';
import 'package:shopybee/view/Screens/ProfileScreen/profile_screen.dart';

// Screens

List<dynamic> screens = [
  HomeScreen(),
  CategoryScreen(),
  CartScreen(),
  ProfileScreen(),
];

// Textstyles

const headBoldStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: primaryColor);

const authScreensTitleStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w500,
);

// Colors
const primaryColor = Color(0xFFFFAC1C);
const primaryBackgroundColor = Colors.white;
Color mutedLineColor = Colors.grey.shade200;
Color mutedTextColor = Colors.grey.shade500;
final mutedTextStyle = TextStyle(color: mutedTextColor);

// Api

const baseUrl = 'http://10.0.2.2:8080/shopybee/';

// Image assets

final String profilePic = "assets/images/profile_pic.jpg";
