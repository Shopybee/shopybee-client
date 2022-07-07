import 'package:flutter/material.dart';
import 'package:shopybee/Ui_blocks/TransparentRoundRectButton.dart';
import 'package:shopybee/Ui_blocks/coloredRoundRectButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/welcome_banner.png'),
            Container(
              padding: EdgeInsets.all(10),
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Welcome to',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'mukta',
                            fontWeight: FontWeight.w500)),
                    Text(
                      'Shopybee',
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.deepOrangeAccent),
                    ),
                    ColoredRoundRectButton(
                      text: 'Signin',
                    ),
                    TransparentRoundRectButton(text: 'Login')
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
