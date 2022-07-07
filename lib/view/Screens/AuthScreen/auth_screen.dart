import 'package:flutter/material.dart';
import 'package:shopybee/Ui_blocks/outlinedNormalButton.dart';
import 'package:shopybee/Ui_blocks/primaryButton.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/welcome_banner.png',
                height: displayHeight(context) * 0.4,
                fit: BoxFit.fill,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Welcome to',
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'mukta',
                        fontWeight: FontWeight.w500)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Shopybee', style: headBoldStyle),
              ),
              SizedBox(
                height: displayHeight(context)*0.14,
              ),
              Center(
                child: PrimaryButton(
                  width: displayWidth(context) * 0.8,
                  height: 45,
                  text: 'Login',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: OutlinedNormalButton(
                    width: displayWidth(context) * 0.8, height: 45, text: 'Register',
                  fontSize: 16,
                ),
              )
            ],

        ),
      ),
    );
  }
}
