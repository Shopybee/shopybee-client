import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/providers/user_detail_provider.dart';

class Authservice {
  final FirebaseAuth _auth;

  Authservice(this._auth);

  final Logger logger = Logger('AuthService');

  Stream<User?> get austhStateChanges => _auth.authStateChanges();

  Future<void> signOut() async {
    await _auth.signOut();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "valid";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUp(
      {required String email,
      required String password,
        required String name,
      required BuildContext context}) async {
    try {
      String? returnResponse;
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        dynamic response =
            await Provider.of<UserDetailProvider>(context, listen: false)
                .registerNewUser(id: value.user!.uid, email: email, name: name);

        if (response.statusCode.toString() == '200') {
          returnResponse = 'valid';
        } else {
          returnResponse = response.toString();
        }
      });

      return returnResponse;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
