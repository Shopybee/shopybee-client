import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/CartScreen/components/price_cart_bottom_sheet.dart';
import 'package:shopybee/view/ui_blocks/cart_card.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        PriceCartBottomSheet(),
        Expanded(child: Consumer<UserDetailProvider>(
          builder: (context, controller, child) {
            return ListView.builder(
              itemCount: controller.cart.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    cartCard(controller.cart[index], index),
                    Container(
                      height: displayHeight(context) * 0.06,
                      width: displayWidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[200]!)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: displayWidth(context) * 0.48,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Add to wish list',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            width: displayWidth(context) * 0.01,
                          ),
                          SizedBox(
                            width: displayWidth(context) * 0.49,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.delete_outlined,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Delete',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ))
      ],
    );
  }
}
