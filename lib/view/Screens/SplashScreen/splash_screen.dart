
import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool init = true;

  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
     await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      final navigator = Navigator.of(context);
      navigator.pushReplacementNamed('/app');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome !',
              style: TextStyle(
                  fontSize: displayWidth(context) * 0.15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'Something to be written soon...',
              style: TextStyle(
                  fontSize: displayWidth(context) * 0.05, color: Colors.white),
            ),
            SizedBox(
              height: displayHeight(context) * 0.1,
            ),
            SizedBox(
              height: displayHeight(context) * 0.1,
            ),
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
