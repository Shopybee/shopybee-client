import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase/auth_services.dart';

class HomeScreen extends StatelessWidget {

  final Authservice _auth = Authservice(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(child: Text('Press to logout'),onPressed: (){
          _auth.signOut().then((value) => Navigator.pushReplacementNamed(context, '/auth'));
        },),
      ),
    );
  }
}
