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

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      backgroundColor: primaryBackgroundColor,
      body: Consumer<AppScreenController>(
        builder: (context, value, child) {
          return screens[controller.getIndex];
        },
      ),
    ));
  }
}
