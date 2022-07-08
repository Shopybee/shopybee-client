import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Forgot password ?',style: TextStyle(color: mutedTextColor),)
      ],
    );
  }
}
