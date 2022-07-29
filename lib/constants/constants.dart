import 'package:flutter/material.dart';
import 'package:shopybee/models/CategoryModel.dart';
import 'package:shopybee/view/Screens/CartScreen/cart_screen.dart';
import 'package:shopybee/view/Screens/HomeScreen/home_screen.dart';
import 'package:shopybee/view/Screens/ProfileScreen/profile_screen.dart';

// Screens

List<dynamic> screens = [
  HomeScreen(),
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

// Category

final List<CategoryModel> categories = [
  CategoryModel(
      bgcolor: Colors.orange[100]!.withOpacity(0.3),
      image: 'assets/images/phone.png',
      route: '',
      label: 'Mobiles'),
  CategoryModel(
      bgcolor: Colors.green[100]!.withOpacity(0.3),
      image: 'assets/images/tv.png',
      route: '',
      label: 'Televisions'),
  CategoryModel(
      bgcolor: Colors.blue[100]!.withOpacity(0.3),
      image: 'assets/images/book.png',
      route: '',
      label: 'Books'),
  CategoryModel(
      bgcolor: Colors.teal[100]!.withOpacity(0.3),
      image: 'assets/images/sports.png',
      route: '',
      label: 'Sports'),
  CategoryModel(
      bgcolor: Colors.brown[100]!.withOpacity(0.3),
      image: 'assets/images/watch.png',
      route: '',
      label: 'Watches'),
  CategoryModel(
      bgcolor: Colors.red[100]!.withOpacity(0.3),
      image: 'assets/images/baby.png',
      route: '',
      label: 'Baby'),
  CategoryModel(
      bgcolor: Colors.yellow[100]!.withOpacity(0.3),
      image: 'assets/images/beauty.png',
      route: '',
      label: 'Beauty'),
  CategoryModel(
      bgcolor: Colors.pink[100]!.withOpacity(0.3),
      image: 'assets/images/season_sale.png',
      route: '',
      label: 'Sale'),
];

// Image assets

final String profilePic = "assets/images/profile_pic.jpg";
