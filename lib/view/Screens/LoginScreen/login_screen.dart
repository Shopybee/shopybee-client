import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/login_screen_controller.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/dontHaveAccount.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/forgotPassword.dart';
import 'package:shopybee/view/Ui_blocks/authPasswordField.dart';
import 'package:shopybee/view/Ui_blocks/authTextField.dart';
import 'package:shopybee/view/ui_blocks/customBackButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Logger logger = Logger('Login Screen');

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.fine('Login Screen builded successfully');
    return SafeArea(child: Scaffold(
      body: Consumer<LoginScreenController>(
        builder: (context, controller, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(route: '/auth'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Login',
                    style: authScreensTitleStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthTextField(
                      label: 'Email',
                      hintText: 'Enter your email',
                      controller: emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthPasswordField(
                      label: 'Password',
                      hintText: 'Enter your Password',
                      controller: passwordController),
                  const ForgotPassword(),
                  const SizedBox(
                    height: 20,
                  ),
                  // PrimaryButton(text: 'Login',width: displayWidth(context),height: 47,fontSize: 16,),
                  SizedBox(
                    width: displayWidth(context),
                    child: MaterialButton(
                        onPressed: () async {
                          final snackbar = ScaffoldMessenger.of(context);
                          final navigator = Navigator.of(context);
                          if (_formKey.currentState!.validate()) {
                            controller.startLoading();
                            final String response =
                                await Provider.of<UserDetailProvider>(context,
                                        listen: false)
                                    .login(
                                        email: emailController.text,
                                        password: passwordController.text);

                            controller.stopLoading();
                            if (response == "OK") {
                              navigator.pushReplacementNamed('/splash');
                            }
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        height: displayHeight(context) * 0.07,
                        color: primaryColor,
                        //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DontHaveAccount(),
                  const SizedBox(
                    height: 50,
                  ),
                  (controller.loading)
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
