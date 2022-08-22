import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/order_screen_controller.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/models/CartItemModel.dart';
import 'package:shopybee/models/CartModel.dart';
import 'package:shopybee/models/OrderModel.dart';
import 'package:shopybee/uitls/custom_methods.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/uitls/enums.dart';
import 'package:http/http.dart' as http;
import 'package:shopybee/view/Screens/OrderScreen/successfull_order_screen.dart';

import '../../../../constants/secrets.dart';

class BottomSheetOrderScreen extends StatefulWidget {
  const BottomSheetOrderScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetOrderScreen> createState() => _BottomSheetOrderScreenState();
}

class _BottomSheetOrderScreenState extends State<BottomSheetOrderScreen> {
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear();
  }

  void openCheckout(String orderId, double amount, String userName,
      String mobile, String email) async {
    var options = {
      'key': razorpay_key,
      'amount': amount,
      'name': userName,
      'description': 'Payment',
      'order_id': orderId,
      'prefill': {'contact': mobile, 'email': email},
      'external': {
        'wallets': ['paytm', 'phonepe']
      }
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    final userDetailProvider =
        Provider.of<UserDetailProvider>(context, listen: false);
    final cartList = userDetailProvider.cart;
    final cartItems = userDetailProvider.cartItems;
    final userId = userDetailProvider.user!.id;
    double originalPrice = 0;
    double discount = 0;
    double coinsUsed = 20;
    double deliveryCharge = 40;
    List<OrderItemList> items = [];
    for (CartModel cartModel in cartList) {
      CartItemModel cartItemModel = cartItems[cartModel.productId]!;
      originalPrice += cartItemModel.price * cartModel.quantity;
      discount += cartItemModel.discount * cartModel.quantity;
      OrderItemList orderItemList = OrderItemList(
          orderItemId: 0,
          categoryId: cartModel.categoryId,
          brandId: cartModel.brandId,
          productId: cartModel.productId,
          originalPrice: cartItemModel.price * cartModel.quantity,
          discount: cartItemModel.discount * cartModel.quantity);
      items.add(orderItemList);
    }
    double priceToPay =
        (originalPrice + deliveryCharge) - (discount + coinsUsed);

    Provider.of<OrderController>(context, listen: false).createNewOrder(
        orderId: response.orderId!,
        paymentId: response.paymentId!,
        orderDate: DateTime.now(),
        userId: userId!,
        totalAmount: priceToPay,
        orderStatus: 0,
        orderStatusMessage: "Order placed",
        orderItemList: items);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessfulOrderScreen(),
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print((json.decode(response.message!) as Map<String, dynamic>)['error']);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: displayHeight(context) * 0.08,
        width: displayWidth(context),
        color: Colors.white,
        child: Consumer<OrderController>(
          builder: (context, controller, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (controller.navigationStatus ==
                        OrderScreenNavigationStatus.summary)
                    ? IconButton(
                        onPressed: () {
                          controller.setNavigationStatus(
                              OrderScreenNavigationStatus.address);
                        },
                        icon: const Icon(Icons.arrow_back_ios),
                        color: primaryColor,
                      )
                    : const SizedBox(),
                (controller.navigationStatus ==
                            OrderScreenNavigationStatus.address ||
                        controller.navigationStatus ==
                            OrderScreenNavigationStatus.summary)
                    ? MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        onPressed: () async {
                          if (controller.navigationStatus ==
                              OrderScreenNavigationStatus.address) {
                            controller.setNavigationStatus(
                                OrderScreenNavigationStatus.summary);
                          } else {
                            final cartList = Provider.of<UserDetailProvider>(
                                    context,
                                    listen: false)
                                .cart;
                            final cartItems = Provider.of<UserDetailProvider>(
                                    context,
                                    listen: false)
                                .cartItems;
                            double originalPrice = 0;
                            double discount = 0;
                            double coinsUsed = 20;
                            double deliveryCharge = 40;
                            for (CartModel cartModel in cartList) {
                              CartItemModel cartItemModel =
                                  cartItems[cartModel.productId]!;
                              originalPrice +=
                                  cartItemModel.price * cartModel.quantity;
                              discount +=
                                  cartItemModel.discount * cartModel.quantity;
                            }
                            double priceToPay =
                                (originalPrice + deliveryCharge) -
                                    (discount + coinsUsed);
                            String userName = Provider.of<UserDetailProvider>(
                                    context,
                                    listen: false)
                                .user!
                                .name;
                            String mobile = Provider.of<UserDetailProvider>(
                                    context,
                                    listen: false)
                                .user!
                                .phone;
                            String email = Provider.of<UserDetailProvider>(
                                    context,
                                    listen: false)
                                .user!
                                .email;
                            String orderId = await generateOrderId(razorpay_key,
                                razorpay_sercret_key, priceToPay * 100);

                            openCheckout(orderId, priceToPay * 100, userName,
                                mobile, email);
                          }
                        },
                        color: primaryColor,
                        child: Row(
                          children: const [
                            Text(
                              "Continue ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.white,
                            )
                          ],
                        ))
                    : const SizedBox()
              ],
            );
          },
        ),
      ),
    );
  }
}
