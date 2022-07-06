/*

  Project Name : Shopybee
  Project Authors : Subhojeet Sahoo and Gurudev Singh
  Creation Date : 6th July, 2022
  Project Aim : Building fullstack E-commerce application for learning purpose.

*/

import 'package:flutter/material.dart';

void main() {
  runApp(const ShopyBeeApp());
}

class ShopyBeeApp extends StatelessWidget {
  const ShopyBeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
