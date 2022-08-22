import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/order_screen_controller.dart';
import 'package:shopybee/uitls/enums.dart';
import 'package:shopybee/view/Screens/OrderScreen/components/bottom_sheet_order_screen.dart';
import 'package:shopybee/view/Screens/OrderScreen/components/order_screen_status_topbar.dart';
import 'package:shopybee/view/Screens/OrderScreen/components/order_summary_body.dart';
import 'package:shopybee/view/Screens/OrderScreen/components/select_address_body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: Consumer<OrderController>(
            builder: (context, controller, child) {
              switch (controller.navigationStatus) {
                case OrderScreenNavigationStatus.address:
                  return const Text("Select Delivery Address");
                case OrderScreenNavigationStatus.summary:
                  return const Text("Order Summary");
              }
            },
          )),
      bottomSheet: const BottomSheetOrderScreen(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const OrderScreenStatusTopbar(),
          const SizedBox(height: 10),
          Expanded(child: Consumer<OrderController>(
            builder: (context, controller, child) {
              switch (controller.navigationStatus) {
                case OrderScreenNavigationStatus.address:
                  return SelectAddressBody();
                case OrderScreenNavigationStatus.summary:
                  return OrderSummaryBody();
              }
            },
          )),
        ],
      ),
    );
  }
}
