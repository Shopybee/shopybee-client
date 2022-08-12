import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/uitls/enums.dart';

class PriceDetailBox extends StatelessWidget {
  const PriceDetailBox({Key? key}) : super(key: key);

  priceDetailRow(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(key), Text(value)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context),
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Price Details",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 20),
          Consumer<UserDetailProvider>(
            builder: (context, controller, child) {
              switch (controller.cartStatus) {
                case CartStatus.fetched:
                  double originalPrice = 0;
                  double totalDiscount = 0;
                  double priceToPay = 0;

                  for (var cart in controller.cart) {
                    if (controller.cartItems[cart.productId] != null) {
                      originalPrice += cart.quantity *
                          (controller.cartItems[cart.productId]!.price);
                      totalDiscount += cart.quantity *
                          (controller.cartItems[cart.productId]!.discount);
                    }
                  }
                  double shopcons = 20;
                  double deliveryCharge = 40;
                  priceToPay = (originalPrice + deliveryCharge) -
                      (totalDiscount + shopcons);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      priceDetailRow("Item(s) price ",
                          "\u{20B9}${originalPrice.truncate()}"),
                      const SizedBox(height: 8),
                      priceDetailRow(
                          "Discount ", "- \u{20B9}${totalDiscount.truncate()}"),
                      const SizedBox(height: 8),
                      priceDetailRow("Shopcons used ", "- \u{20B9}${20}"),
                      const SizedBox(height: 8),
                      priceDetailRow("Delivery Charges ", "\u{20B9}${40}"),
                      const Divider(
                        height: 20,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            '\u{20B9}${priceToPay.truncate()}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Divider(
                        height: 20,
                        color: Colors.grey,
                      ),
                      Text(
                        "Total savings : \u{20B9}${(originalPrice - priceToPay).truncate()}",
                        style: const TextStyle(
                            color: primaryColor,
                            fontFamily: "Mukta",
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );

                case CartStatus.notFetched:
                  return const Center(
                    child: Text('Not fetched'),
                  );

                case CartStatus.fetching:
                  return const Center(child: Text('Fetching'));
              }
            },
          ),
        ],
      ),
    );
  }
}
