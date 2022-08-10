import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';

class PriceCartBottomSheet extends StatelessWidget {
  const PriceCartBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: displayWidth(context),
        //color: Colors.red.shade200,
        height: displayHeight(context) * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<UserDetailProvider>(
              builder: (context, controller, child) {
                double originalPrice = 0;
                double totalDiscount = 0;
                double priceToPay = 0;
                for (var cart in controller.cart) {
                  originalPrice += cart.quantity *
                      (controller.cartItems[cart.productId]!.price);
                  totalDiscount += cart.quantity *
                      (controller.cartItems[cart.productId]!.discount);
                }
                priceToPay = originalPrice - totalDiscount;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      originalPrice.truncate().toString(),
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      '\u{20B9}${priceToPay.truncate()}',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                );
              },
            ),
            SizedBox(
              width: displayWidth(context) * 0.4,
              child: MaterialButton(
                onPressed: () {},
                color: primaryColor,
                child: const Text(
                  "Place Order",
                  style: TextStyle(
                      fontSize: 15.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
