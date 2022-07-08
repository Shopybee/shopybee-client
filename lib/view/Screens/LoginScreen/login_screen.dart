import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/Ui_blocks/authPasswordField.dart';
import 'package:shopybee/Ui_blocks/authTextField.dart';
import 'package:shopybee/Ui_blocks/customBackButton.dart';
import 'package:shopybee/Ui_blocks/primaryButton.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/login_screen_controller.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/dontHaveAccount.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/forgotPassword.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/loginWithOthersButton.dart';

class LoginScreen extends StatelessWidget {
  final Logger logger=Logger('Login Screen');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    logger.fine('Login Screen builded successfully');
    final controllerL = Provider.of<LoginScreenController>(context);
    final controller = Provider.of<LoginScreenController>(context,listen: false);
    bool loading = controllerL.getLoading;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              const SizedBox(height: 20,),
              const Text('Login',style: authScreensTitleStyle,),
              const SizedBox(height: 20,),
              AuthTextField(label: 'Email',hintText: 'Enter your email',controller: emailController),
              const SizedBox(height: 10,),
              AuthPasswordField(label: 'Password',hintText: 'Enter your Password',controller: passwordController),
              const ForgotPassword(),
              const SizedBox(height: 20,),
              PrimaryButton(text: 'Login',width: displayWidth(context),height: 47,fontSize: 16,),
              const SizedBox(height: 20,),
              const DontHaveAccount(),
              const SizedBox(height: 50,),
              (loading)?const CircularProgressIndicator():const SizedBox(),

            ],
          ),
        )
      ),
    );
  }
}
