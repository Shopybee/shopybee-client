/*

  Project Name : Shopybee
  Project Authors : { Subhojeet Sahoo, Gurudev Singh , Vishal Mahato }
  Creation Date : 6th July, 2022
  Project Aim : Building fullstack E-commerce application for learning purpose.

*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/add_address_screen_controller.dart';
import 'package:shopybee/controllers/login_screen_controller.dart';
import 'package:shopybee/providers/firebase_user_provider.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/uitls/global_context.dart';
import 'package:shopybee/view/Screens/AddAddressScreen/add_address_screen.dart';
import 'package:shopybee/view/Screens/AddressScreen/address_screen.dart';
import 'package:shopybee/view/Screens/AppScreen/app_screen.dart';
import 'package:shopybee/view/Screens/AuthScreen/auth_screen.dart';
import 'package:shopybee/view/Screens/LoginScreen/login_screen.dart';
import 'package:shopybee/view/Screens/RegisterScreen/register_screen.dart';
import 'package:shopybee/view/Screens/SplashScreen/splash_screen.dart';
import 'controllers/app_screen_controller.dart';
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
        //******* Auth Providers ***********//
        ChangeNotifierProvider(
          create: (context) => AuthNotifier(),
        ),
        //******* Screen controllers ********//
        ChangeNotifierProvider(
          create: (context) => AppScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddAddressScreenController(),
        ),

        //****** Data controllers *******//

        ChangeNotifierProvider(
          create: (context) => UserDetailProvider(),
        ),
      ],
      child: MaterialApp(
          routes: {
            '/auth': (context) => AuthScreen(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/splash': (context) => SplashScreen(),
            '/app': (context) => AppScreen(),
            '/addAddress': (context) => AddAddressScreen(),
            '/address': (context) => AddressScreen(),
          },
          debugShowCheckedModeBanner: false,
          navigatorKey: GlobalContext.contextKey,
          home: AuthScreen()),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const SplashScreen();
    } else {
      return AuthScreen();
    }
  }
}
