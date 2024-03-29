import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/uitls/enums.dart';
import 'package:shopybee/view/Screens/CartScreen/components/cart_list.dart';
import 'package:shopybee/view/Screens/CartScreen/components/empty_cart_box.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: displayHeight(context) * 0.065,
        elevation: 0,
        centerTitle: true,
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
                return const EmpyCartBox();
              } else {
                return const CartList();
              }

            case CartStatus.notFetched:
              return const Text('Tap to fetch');
            case CartStatus.fetching:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
