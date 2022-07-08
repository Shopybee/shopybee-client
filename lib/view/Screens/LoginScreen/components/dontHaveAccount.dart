import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account ? "),
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/register'),
          child: Text('Register',style: TextStyle(color: Colors.blue),),
        )
      ],
    );
  }
}
