import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';

class AuthTextField extends StatelessWidget {
  String? label;
  String? hintText;
  AuthTextField({this.label,this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText!,
              hintStyle: TextStyle(
                color: mutedTextColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: mutedLineColor,
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: mutedLineColor,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ),
        ],
      ),
    );
  }
}
