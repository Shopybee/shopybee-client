import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/CartScreen/components/empty_cart_box.dart';
import 'package:shopybee/view/ui_blocks/body_with_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: displayHeight(context) * 0.065,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: primaryColor,
      ),
      body: Consumer<UserDetailProvider>(
        builder: (context, controller, child) {
          if (controller.cartStatus == CartStatus.notFetched) {
            controller.getCart();
          }
          switch (controller.cartStatus) {
            case CartStatus.fetched:
              if (controller.cart.isEmpty) {
                return EmpyCartBox();
              } else {
                return Text("Not empty");
              }

            case CartStatus.notFetched:
              return Text('Tap to fetch');
            case CartStatus.fetching:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
