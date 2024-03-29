import 'package:flutter/material.dart';
import 'package:shopybee/view/ui_blocks/body_with_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWithAppBar(
      body: ListView(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        children: [],
      ),
    );
  }
}
