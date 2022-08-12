import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/order_screen_controller.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/uitls/enums.dart';

class BottomSheetOrderScreen extends StatelessWidget {
  const BottomSheetOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: displayHeight(context) * 0.08,
        width: displayWidth(context),
        color: Colors.white,
        child: Consumer<OrderScreenController>(
          builder: (context, controller, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (controller.navigationStatus ==
                            OrderScreenNavigationStatus.summary ||
                        controller.navigationStatus ==
                            OrderScreenNavigationStatus.payment)
                    ? IconButton(
                        onPressed: () {
                          if (controller.navigationStatus ==
                              OrderScreenNavigationStatus.summary) {
                            controller.setNavigationStatus(
                                OrderScreenNavigationStatus.address);
                          } else {
                            controller.setNavigationStatus(
                                OrderScreenNavigationStatus.summary);
                          }
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
                        onPressed: () {
                          if (controller.navigationStatus ==
                              OrderScreenNavigationStatus.address) {
                            controller.setNavigationStatus(
                                OrderScreenNavigationStatus.summary);
                          } else {
                            controller.setNavigationStatus(
                                OrderScreenNavigationStatus.payment);
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
