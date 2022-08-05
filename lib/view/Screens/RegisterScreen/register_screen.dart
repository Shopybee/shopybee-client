
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/models/UserModel.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/view/ui_blocks/authPasswordField.dart';
import 'package:shopybee/view/ui_blocks/authTextField.dart';
import 'package:shopybee/view/ui_blocks/customBackButton.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/register_screen_controller.dart';
import 'package:shopybee/uitls/device_size.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Logger logger = Logger('Register Screen');

  TextEditingController titleController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final space = const SizedBox(height: 10);

  @override
  void dispose() {
    titleController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.fine('Register Screen build successfully');

    return SafeArea(
      child: Scaffold(
        body: Consumer<RegisterScreenController>(
          builder: (context, controller, child) {
            return (controller
                    .getLoading) // if user is trying to create new account
                ? const Center(
                    child:
                        CircularProgressIndicator(), // will be changed to shimmer effect later
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
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
                            'Create New Account',
                            style: authScreensTitleStyle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AuthTextField(
                            label: 'Name',
                            hintText: 'Enter your name',
                            controller: titleController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "cannot be empty";
                              }

                              return null;
                            },
                          ),
                          space,
                          AuthTextField(
                            label: 'Phone number',
                            prefix: const Text('+91 '),
                            hintText: 'Enter your phone number',
                            controller: phoneController,
                            validator: (value) {
                              String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value!)) {
                                return 'Enter valid phone number';
                              }

                              return null;
                            },
                          ),
                          space,
                          AuthTextField(
                            label: 'Email',
                            hintText: 'Enter your email',
                            controller: emailController,
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(value!);
                              if (!emailValid) {
                                return 'Enter valid email';
                              }
                              return null;
                            },
                          ),
                          space,
                          AuthPasswordField(
                            controller: passwordController,
                            label: 'Password',
                            hintText: 'Enter your Password',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // PrimaryButton(text: ,width: displayWidth(context),height: 47,fontSize: 16,callBack: ),
                          SizedBox(
                            width: displayWidth(context),
                            child: MaterialButton(
                                onPressed: () async {
                                  final snackbar =
                                      ScaffoldMessenger.of(context);
                                  final navigator = Navigator.of(context);
                                  if (_formKey.currentState!.validate()) {
                                    logger.info('Registration form validated');
                                    controller.startLoading();
                                    final String response =
                                        await Provider.of<UserDetailProvider>(
                                                context,
                                                listen: false)
                                            .registerNewUser(
                                                user: UserModel(
                                                    password:
                                                        passwordController.text,
                                                    email: emailController.text,
                                                    name: titleController.text,
                                                    phone:
                                                        phoneController.text));
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
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account ? "),
                              InkWell(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/login'),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
