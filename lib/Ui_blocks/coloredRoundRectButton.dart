import 'package:flutter/material.dart';

class ColoredRoundRectButton extends StatelessWidget {
  final String text;
  const ColoredRoundRectButton({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          alignment: Alignment.center,
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
