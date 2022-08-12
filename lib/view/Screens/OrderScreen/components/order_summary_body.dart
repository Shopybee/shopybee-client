import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/order_screen_controller.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/OrderScreen/components/price_detail_box.dart';
import 'package:shopybee/view/ui_blocks/cart_card.dart';

class OrderSummaryBody extends StatelessWidget {
  const OrderSummaryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: displayHeight(context) * 0.1,
            width: displayWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xfbFFFDD0), Color(0xfbFFF8DC)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Consumer<OrderScreenController>(
                      builder: (context, controller, child) {
                        return InkWell(
                            onTap: () {
                              if (controller.usingShopcons) {
                                controller.dontUseShopcons();
                              } else {
                                controller.useShopcons();
                              }
                            },
                            child: Icon((controller.usingShopcons)
                                ? Icons.check_box
                                : Icons.check_box_outline_blank));
                      },
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Pay using Shopcons",
                      style: TextStyle(
                        fontFamily: "Mukta",
                        fontSize: 16.5,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Opacity(
                      opacity: 0,
                      child: Icon(Icons.check_box_outline_blank),
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Available Balance: ',
                    ),
                    Text('50 '),
                    Icon(
                      FontAwesomeIcons.coins,
                      size: 11,
                      color: Colors.indigo,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Consumer<UserDetailProvider>(
            builder: (context, controller, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.cart.length,
                itemBuilder: (context, index) {
                  return cartCard(controller.cart[index], index);
                },
              );
            },
          ),
          const SizedBox(height: 10),
          const PriceDetailBox(),
        ],
      ),
    );
  }
}
