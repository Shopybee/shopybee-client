// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [Image.asset('assets/images/welcome_banner.jpg')],
        ),
      ),
    );
  }
}
