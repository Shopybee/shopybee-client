import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/models/MobileModel.dart';
import 'package:shopybee/uitls/device_size.dart';

class MobileDetailBottomSheetCart extends StatelessWidget {
  final MobileModel mobile;
  final int categoryId;

  MobileDetailBottomSheetCart({required this.mobile, required this.categoryId});

  final _logger = Logger('MobileDetailBottomSheetCart');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.07,
      width: displayWidth(context),
      color: Colors.white,
      alignment: Alignment.center,
      child: Consumer<UserDetailProvider>(
        builder: (context, controller, child) {
          if (controller.cartStatus == CartStatus.notFetched) {
            controller.getCart();
          }
          switch (controller.cartStatus) {
            case CartStatus.fetched:
              int cartIndex = controller.cart
                  .indexWhere((item) => item.productId == mobile.productId);
              if (cartIndex != -1) {
                return Container(
                  height: displayHeight(context) * 0.06,
                  width: displayWidth(context) * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black87,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (controller.cart[cartIndex].quantity > 1) {
                            controller.updateCart(
                              cartIndex,
                              controller.cart[cartIndex].cartId,
                              controller.cart[cartIndex].quantity - 1,
                              categoryId,
                              controller.cart[cartIndex].brandId,
                              controller.cart[cartIndex].productId,
                            );
                          } else {
                            controller.removeItemFromCart(
                                controller.cart[cartIndex].cartId);
                          }
                        },
                        icon: const Icon(Icons.remove),
                        color: Colors.white,
                      ),
                      Text(
                        controller.cart[cartIndex].quantity.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.updateCart(
                            cartIndex,
                            controller.cart[cartIndex].cartId,
                            controller.cart[cartIndex].quantity + 1,
                            categoryId,
                            controller.cart[cartIndex].brandId,
                            controller.cart[cartIndex].productId,
                          );
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox(
                  width: displayWidth(context) * 0.6,
                  child: MaterialButton(
                    height: displayHeight(context) * 0.06,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.black87,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart_checkout_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'ADD TO CART',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onPressed: () {
                      _logger.info("Add to cart");
                      controller.addToCart(
                          categoryId, mobile.brandId, mobile.productId);
                    },
                  ),
                );
              }

            case CartStatus.notFetched:
              return TextButton(
                onPressed: () {
                  _logger.info("Tap to get");
                },
                child: const Text('TAP TO GET CART',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              );

            case CartStatus.fetching:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
