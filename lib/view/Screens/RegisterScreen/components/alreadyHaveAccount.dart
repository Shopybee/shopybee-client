import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account ? "),
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/login'),
          child: Text('Login',style: TextStyle(color: Colors.blue),),
        )
      ],
    );
  }
}
