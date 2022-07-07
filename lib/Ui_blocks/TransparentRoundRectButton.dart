import 'package:flutter/material.dart';

class TransparentRoundRectButton extends StatelessWidget {
  final String text;
  const TransparentRoundRectButton({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          alignment: Alignment.center,
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
