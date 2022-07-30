import 'package:flutter/material.dart';
import 'package:shopybee/view/ui_blocks/body_with_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWithAppBar(
        body: Container(
      alignment: Alignment.center,
      child: Text('Cart Screen'),
    ));
  }
}
