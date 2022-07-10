import 'package:flutter/material.dart';
import 'package:shopybee/view/ui_blocks/body_with_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWithAppBar(
        child: Container(
      alignment: Alignment.center,
      child: const Text('Home Screen'),
    ));
  }
}
