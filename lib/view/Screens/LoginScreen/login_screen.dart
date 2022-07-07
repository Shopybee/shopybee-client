import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class LoginScreen extends StatelessWidget {
  final Logger logger=Logger('Login Screen');
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.fine('Login Screen builded successfully');
    return Scaffold(
      body: Center(
        child: Text('login screen'),
      ),
    );
  }
}
