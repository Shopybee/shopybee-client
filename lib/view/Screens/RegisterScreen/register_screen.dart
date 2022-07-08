import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/Ui_blocks/authPasswordField.dart';
import 'package:shopybee/Ui_blocks/authTextField.dart';
import 'package:shopybee/Ui_blocks/customBackButton.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/register_screen_controller.dart';
import 'package:shopybee/services/firebase/auth_services.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/RegisterScreen/components/alreadyHaveAccount.dart';

class RegisterScreen extends StatelessWidget {
  final Logger logger=Logger('Register Screen');
  TextEditingController titleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Authservice _auth = Authservice(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    logger.fine('Register Screen build successfully');
    final controllerL = Provider.of<RegisterScreenController>(context);
    final controller = Provider.of<RegisterScreenController>(context);
    final bool loading = controllerL.getLoading;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  const SizedBox(height: 20,),
                  const Text('Create New Account',style: authScreensTitleStyle,),
                  const SizedBox(height: 20,),
                  AuthTextField(label: 'Name',hintText: 'Enter your name',controller: titleController),
                  const SizedBox(height: 10,),
                  AuthTextField(label: 'Email',hintText: 'Enter your email',controller: emailController),
                  const SizedBox(height: 10,),
                  AuthPasswordField(label: 'Password',hintText: 'Enter your Password',),
                  const SizedBox(height: 20,),
                 // PrimaryButton(text: ,width: displayWidth(context),height: 47,fontSize: 16,callBack: ),
              SizedBox(
                width: displayWidth(context),
                child: MaterialButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        controller.startLoading();

                        final String? response = await _auth.signUp(email: emailController.text, password: passwordController.text, context: context);

                        if(response!=null){
                          if(response!='valid'){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response)));
                          }
                        }
                      }
                       },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: displayHeight(context)*0.07,
                    color: primayColor,
                    //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    )),
              ),
                  const SizedBox(height: 20,),
                  const AlreadyHaveAccount(),
                  const SizedBox(height: 10,),

                ],
              ),
            ),
          )
      ),
    );
  }
}
