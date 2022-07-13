import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';

class AuthTextField extends StatelessWidget {
  TextEditingController controller;
  String? label;
  String? hintText;
  Widget? prefix;
  String? Function(String?)? validator;
  AuthTextField({this.label, this.hintText,required this.controller,this.validator,this.prefix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            validator: validator,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              prefix: prefix,
              errorStyle: const TextStyle(color: Colors.redAccent),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              alignLabelWithHint: true,
              hintText: hintText!,
              hintStyle: TextStyle(
                color: mutedTextColor,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: mutedLineColor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: mutedLineColor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ],
      ),
    );
  }
}
