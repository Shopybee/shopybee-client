import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class AddressTextfield extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  String? hintText;
  Widget? prefix;
  AddressTextfield({this.label, this.hintText,required this.controller,this.prefix});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            maxLines: 10,
            minLines: 1,
            controller: controller!,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Cannot be empty';
              }
              return null;
            },
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              labelText: label??"UNNAMED",
              labelStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500
              ),
              // label: Text("unnamed"),
              errorStyle: const TextStyle(color: Colors.redAccent),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              alignLabelWithHint: true,
              hintText: hintText??"unnamed",
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.normal
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              prefix: prefix??null,
            ),
          ),
        ],
      ),
    );;
  }
}
