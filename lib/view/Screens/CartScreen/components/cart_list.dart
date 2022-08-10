import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/models/CartModel.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/uitls/enums.dart';
import 'package:shopybee/view/Screens/CartScreen/components/price_cart_bottom_sheet.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  cartCard(CartModel item, int index) {
    return Consumer<UserDetailProvider>(
      builder: (context, controller, child) {
        if (!controller.cartItemStatus.containsKey(item.productId) ||
            controller.cartItemStatus[item.productId] ==
                CartItemStatus.notFetched) {
          controller.getCartItem(item.categoryId, item.brandId, item.productId);
        }
        switch (controller.cartItemStatus[item.productId]) {
          case CartItemStatus.fetched:
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: displayHeight(context) * 0.2,
              width: displayWidth(context),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: displayWidth(context) * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Image.asset('assets/images/test_img.png'),
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: displayHeight(context) * 0.08,
                          width: displayWidth(context) * 0.45,
                          //color: Colors.red.shade100,
                          child: Text(
                            controller.cartItems[item.productId]!.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Mukta",
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          //color: Colors.red.shade100,
                          height: displayHeight(context) * 0.07,
                          width: displayWidth(context) * 0.55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '\u{20B9} ${controller.cartItems[item.productId]!.price.truncate() * item.quantity}',
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '\u{20B9} ${(controller.cartItems[item.productId]!.price.truncate() - controller.cartItems[item.productId]!.discount.truncate()) * item.quantity}',
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: displayWidth(context) * 0.1,
                                    child: MaterialButton(
                                      height: displayHeight(context) * 0.04,
                                      onPressed: () {
                                        if (item.quantity > 1) {
                                          controller.updateCart(
                                              index,
                                              item.cartId,
                                              item.quantity - 1,
                                              item.categoryId,
                                              item.brandId,
                                              item.productId);
                                        }
                                      },
                                      color: Colors.black87,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                      child: const Text(
                                        "-",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 4),
                                  SizedBox(
                                    width: displayWidth(context) * 0.1,
                                    child: MaterialButton(
                                      height: displayHeight(context) * 0.04,
                                      onPressed: () {
                                        controller.updateCart(
                                            index,
                                            item.cartId,
                                            item.quantity + 1,
                                            item.categoryId,
                                            item.brandId,
                                            item.productId);
                                      },
                                      color: Colors.black87,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: const Text(
                                        "+",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

          case CartItemStatus.notFetched:
            return Text("Not fetched");
          case CartItemStatus.fetching:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case null:
            return Text("Not fetched");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        const PriceCartBottomSheet(),
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
