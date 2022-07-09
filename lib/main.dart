/*

  Project Name : Shopybee
  Project Authors : Subhojeet Sahoo and Gurudev Singh
  Creation Date : 6th July, 2022
  Project Aim : Building fullstack E-commerce application for learning purpose.

*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/login_screen_controller.dart';
import 'package:shopybee/providers/firebase_user_provider.dart';
import 'package:shopybee/providers/user_provider.dart';
import 'package:shopybee/services/firebase/auth_services.dart';
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
        Provider<Authservice>(
            create: (_) => Authservice(FirebaseAuth.instance)),
        StreamProvider(
          create: (context) => context.read<Authservice>().austhStateChanges,
          initialData: null,
        ),
        //******* Screen controllers ********//
        ChangeNotifierProvider(create: (context) => AppScreenController(),),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterScreenController(),
        ),

        //****** Data controllers *******//

        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/auth':(context) => AuthScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/splash' : (context) => SplashScreen(),
          '/app':(context) => AppScreen(),

        },
        debugShowCheckedModeBanner: false,
        home: Consumer<AuthNotifier>(
          builder: (context, notifier, child) {
            return notifier.user != null
                ? const SplashScreen()
                : const Wrapper();
          },
        ),
      ),
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
