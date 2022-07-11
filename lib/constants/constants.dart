import 'package:flutter/material.dart';
import 'package:shopybee/view/Screens/CartScreen/cart_screen.dart';
import 'package:shopybee/view/Screens/HomeScreen/home_screen.dart';
import 'package:shopybee/view/Screens/ProfileScreen/profile_screen.dart';

// constant screens

const List<dynamic> screens = [
  HomeScreen(),
  CartScreen(),
  ProfileScreen(),
];

// constant Textstyles

const headBoldStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: primaryColor);

const authScreensTitleStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w500,
);

// constant colors
const primaryColor = Color(0xFFFFAC1C);
const primaryBackgroundColor = Colors.white;
Color mutedLineColor = Colors.grey.shade200;
Color mutedTextColor = Colors.grey.shade500;
final mutedTextStyle = TextStyle(color: mutedTextColor);

// api constants

const baseUrl =
    'https://shopybee-8115d-default-rtdb.asia-southeast1.firebasedatabase.app/';
