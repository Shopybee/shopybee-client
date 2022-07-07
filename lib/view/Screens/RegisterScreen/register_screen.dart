import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RegisterScreen extends StatelessWidget {
  final Logger logger=Logger('Register Screen');

  @override
  Widget build(BuildContext context) {
    logger.fine('Register screen builded successfully');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('sign up screen'),
      ),
    );
  }
}
