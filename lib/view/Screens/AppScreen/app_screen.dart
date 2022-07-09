import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/app_screen_controller.dart';
import '../../../services/firebase/auth_services.dart';
import 'components/custom_navbar.dart';

class AppScreen extends StatelessWidget {
  final Authservice _auth = Authservice(FirebaseAuth.instance);
  final Logger logger = Logger('AppScreen');

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppScreenController>(context);
    final controllerL = Provider.of<AppScreenController>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      backgroundColor: primaryBackgroundColor,
      body: screens[controllerL.getIndex],
    ));
  }
}
