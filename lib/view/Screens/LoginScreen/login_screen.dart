import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/login_screen_controller.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/dontHaveAccount.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/forgotPassword.dart';
import 'package:shopybee/view/Screens/LoginScreen/components/loginWithOthersButton.dart';
import 'package:shopybee/view/Ui_blocks/authPasswordField.dart';
import 'package:shopybee/view/Ui_blocks/authTextField.dart';
import 'package:shopybee/view/Ui_blocks/customBackButton.dart';

import '../../../services/firebase/auth_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Logger logger = Logger('Login Screen');

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Authservice _auth = Authservice(FirebaseAuth.instance);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.fine('Login Screen builded successfully');
    final controllerL = Provider.of<LoginScreenController>(context);
    final controller =
        Provider.of<LoginScreenController>(context, listen: false);
    bool loading = controllerL.getLoading;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
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
                        logger.fine('Login form validated');
                        String? response = await _auth.signIn(
                            email: emailController.text,
                            password: passwordController.text);
                        controller.stopLoading();
                        if (response != 'valid') {
                          snackbar
                              .showSnackBar(SnackBar(content: Text(response!)));
                        } else {
                          navigator.pushReplacementNamed('/home');
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
              (loading) ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
            ],
          ),
        ),
      )),
    );
  }
}
