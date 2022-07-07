import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';

class LoginWithOthersButton extends StatelessWidget {
  double width;
  Image image;
  String text;
  LoginWithOthersButton({Key? key,
  required this.width,required this.image,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            width: 1.5,color: mutedLineColor
          ),
        ),
        height: 45,
      child: Row(
          children: [
            SizedBox(
              height: 22,
                width: 22,
                child: image),
            SizedBox(width: 10,),
            Text(text,style: TextStyle(fontSize: 16),)
        ],
      ),),
    );
  }
}
