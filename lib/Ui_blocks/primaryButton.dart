import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  double? height;
  double? width;
  double? fontSize;
  PrimaryButton({Key? key,
    required this.text, this.height, this.width,this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
         onPressed: () {

         },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          height: height!,
          color: primayColor,
          //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(color: Colors.white,fontSize: fontSize),
          )),
    );
  }
}
