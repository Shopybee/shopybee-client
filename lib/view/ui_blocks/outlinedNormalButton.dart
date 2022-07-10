import 'package:flutter/material.dart';

class OutlinedNormalButton extends StatelessWidget {
  final String text;
  double? width;
  double? height;
  double? fontSize;
  VoidCallback? callBack;
  OutlinedNormalButton(
      { required this.text, this.width, this.height, this.fontSize,this.callBack});

  VoidCallback nothing = (){};
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!,
      child: MaterialButton(
          onPressed: callBack??nothing,
          height: height!,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: fontSize),
          )),
    );
  }
}
