import 'package:flutter/material.dart';

class OutlinedNormalButton extends StatelessWidget {
  final String text;
  double? width;
  double? height;
  double? fontSize;
  OutlinedNormalButton({Key? key, required this.text,
  this.width,this.height,this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!,
      child: MaterialButton(
        onPressed: (){},
          height: height!,
          shape: RoundedRectangleBorder(side: BorderSide(
            width: 1,
          ),
            borderRadius: BorderRadius.circular(10),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(color: Colors.black,fontSize: fontSize),
          )),
    );
  }
}
