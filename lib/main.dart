/*

  Project Name : Shopybee
  Project Authors : Subhojeet Sahoo and Gurudev Singh
  Creation Date : 6th July, 2022
  Project Aim : Building fullstack E-commerce application for learning purpose.

*/

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/login_screen_controller.dart';
import 'package:shopybee/view/Screens/AuthScreen/auth_screen.dart';
import 'package:shopybee/view/Screens/LoginScreen/login_screen.dart';
import 'package:shopybee/view/Screens/RegisterScreen/register_screen.dart';

import 'controllers/register_screen_controller.dart';

void main() async {
  // logger configuration
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint(
        '${record.loggerName} -> ${record.level.name}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ShopyBeeApp());
}

class ShopyBeeApp extends StatelessWidget {
  final Logger logger = Logger('ShopyBeeApp');

  @override
  Widget build(BuildContext context) {
    logger.fine('ShopyBee App initialised successfully');
    return MultiProvider(
      providers: [
        // Screen controllers
        ChangeNotifierProvider(create: (context) => LoginScreenController(),),
        ChangeNotifierProvider(create: (context) => RegisterScreenController(),),
        // Data controllers
      ],
      child: MaterialApp(
        routes: {
          '/login':(context) => LoginScreen(),
          '/register':(context) => RegisterScreen()
        },
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
      ),
    );
  }
}
