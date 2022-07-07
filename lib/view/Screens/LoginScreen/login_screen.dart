import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/Ui_blocks/authPasswordField.dart';
import 'package:shopybee/Ui_blocks/authTextField.dart';
import 'package:shopybee/Ui_blocks/customBackButton.dart';
import 'package:shopybee/Ui_blocks/primaryButton.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/dontHaveAccount.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/forgotPassword.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/loginWithOthersButton.dart';

class LoginScreen extends StatelessWidget {
  final Logger logger=Logger('Login Screen');
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.fine('Login Screen builded successfully');
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),
              SizedBox(height: 20,),
              Text('Register',style: authScreensTitleStyle,),
              SizedBox(height: 20,),
              AuthTextField(label: 'Email',hintText: 'Enter your email'),
              SizedBox(height: 10,),
              AuthPasswordField(label: 'Password',hintText: 'Enter your Password',),
              ForgotPassword(),
              SizedBox(height: 20,),
              PrimaryButton(text: 'Login',width: displayWidth(context),height: 47,fontSize: 16,),
              SizedBox(height: 20,),
              DontHaveAccount(),
              SizedBox(height: 10,),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Expanded(child: Divider(thickness: 1.5,)),
              //     Text(' or ',style: mutedTextStyle,),
              //     Expanded(child: Divider(thickness: 1.5,)),
              //   ],
              // ),
            ],
          ),
        )
      ),
    );
  }
}
