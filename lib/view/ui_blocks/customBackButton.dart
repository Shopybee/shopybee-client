import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final String route;
  CustomBackButton({required this.route});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pushReplacementNamed(context, route),
        icon: const Icon(Icons.arrow_back_ios));
  }
}
