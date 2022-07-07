import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/Ui_blocks/authPasswordField.dart';
import 'package:shopybee/Ui_blocks/authTextField.dart';
import 'package:shopybee/Ui_blocks/customBackButton.dart';
import 'package:shopybee/Ui_blocks/primaryButton.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/RegisterScreen/components/alreadyHaveAccount.dart';

class RegisterScreen extends StatelessWidget {
  final Logger logger=Logger('Register Screen');
  TextEditingController titleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    logger.fine('Register Screen build successfully');
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                const SizedBox(height: 20,),
                const Text('Register',style: authScreensTitleStyle,),
                const SizedBox(height: 20,),
                AuthTextField(label: 'Name',hintText: 'Enter your name',controller: titleController),
                const SizedBox(height: 10,),
                AuthTextField(label: 'Email',hintText: 'Enter your email',controller: emailController),
                const SizedBox(height: 10,),
                AuthPasswordField(label: 'Password',hintText: 'Enter your Password',),
                const SizedBox(height: 20,),
                PrimaryButton(text: 'Register',width: displayWidth(context),height: 47,fontSize: 16,),
                const SizedBox(height: 20,),
                const AlreadyHaveAccount(),
                const SizedBox(height: 10,),

              ],
            ),
          )
      ),
    );
  }
}
