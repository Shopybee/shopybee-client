import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';

class AuthPasswordField extends StatelessWidget {
  String? label;
  String? hintText;
  AuthPasswordField({this.label,this.hintText});

  bool visible=false;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          TextFormField(
            obscureText: visible?false:true,
            decoration: InputDecoration(
              suffixIcon: visible?
              IconButton(
                onPressed: () => visible=false,
                  icon:Icon(Icons.visibility)):
              IconButton(onPressed: () => visible=true,
                  icon:Icon(Icons.visibility_off)),
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
