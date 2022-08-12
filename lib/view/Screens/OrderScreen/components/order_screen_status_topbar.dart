import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/order_screen_controller.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/uitls/enums.dart';

class OrderScreenStatusTopbar extends StatelessWidget {
  const OrderScreenStatusTopbar({Key? key}) : super(key: key);

  final labelStyle =
      const TextStyle(fontFamily: "Mukta", color: Colors.black54, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: displayHeight(context) * 0.1,
        width: displayWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        color: Colors.white,
        child: Consumer<OrderScreenController>(
          builder: (context, controller, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.navigationStatus ==
                                    OrderScreenNavigationStatus.address
                                ? primaryColor
                                : Colors.transparent,
                            border:
                                Border.all(color: primaryColor, width: 1.8)),
                      ),
                      const Expanded(
                        child: Divider(
                          indent: 10,
                          thickness: 1,
                          endIndent: 10,
                          color: primaryColor,
                        ),
                      ),
                      Container(
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.navigationStatus ==
                                    OrderScreenNavigationStatus.summary
                                ? primaryColor
                                : Colors.transparent,
                            border:
                                Border.all(color: primaryColor, width: 1.8)),
                      ),
                      const Expanded(
                        child: Divider(
                          indent: 10,
                          thickness: 1,
                          endIndent: 10,
                          color: primaryColor,
                        ),
                      ),
                      Container(
                        width: 25,
                        decoration: BoxDecoration(
                            color: controller.navigationStatus ==
                                    OrderScreenNavigationStatus.payment
                                ? primaryColor
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: primaryColor, width: 1.8)),
                      ),
                    ],
                  ),
                ),

                // 2nd child for labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Address",
                      style: labelStyle,
                    ),
                    const Expanded(
                      child: Opacity(
                        opacity: 0,
                        child: Divider(
                          indent: 10,
                          thickness: 1,
                          endIndent: 10,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      "Summary",
                      style: labelStyle,
                    ),
                    const Expanded(
                      child: Opacity(
                        opacity: 0,
                        child: Divider(
                          indent: 10,
                          thickness: 1,
                          endIndent: 10,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Text(
                      "Payment",
                      style: labelStyle,
                    )
                  ],
                ),

                const SizedBox(
                  height: 5,
                ),
              ],
            );
          },
        ));
  }
}
