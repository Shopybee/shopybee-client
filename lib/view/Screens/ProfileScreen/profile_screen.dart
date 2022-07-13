import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopybee/services/firebase/auth_services.dart';

class ProfileScreen extends StatelessWidget {
  final Authservice _auth = Authservice(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        child: Text('Logout'),
        onPressed: () async {
          final navigator = Navigator.of(context);
          await _auth.signOut();
          navigator.pushReplacementNamed('/auth');
        },
      ),
    );
  }
}
