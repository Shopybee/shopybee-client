import 'package:flutter/material.dart';

class CategoryModel {
  final String label;
  final Color bgcolor;
  final String image;
  final String route;

  CategoryModel(
      {required this.bgcolor, required this.image, required this.label,required this.route});
}
