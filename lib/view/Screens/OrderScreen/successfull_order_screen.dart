import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/app_screen_controller.dart';
import 'package:shopybee/uitls/device_size.dart';

class SuccessfulOrderScreen extends StatelessWidget {
  const SuccessfulOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: displayHeight(context) * 0.65,
              width: displayWidth(context),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xfbf09819),
                  Color(0xfbedde5d),
                ], begin: Alignment.topRight),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.1,
                  ),
                  Image.asset(
                    'assets/images/order_successful.png',
                    height: displayHeight(context) * 0.15,
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 13,
                      ),
                      child: Text(
                        "Congratulations !!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.green,
                            fontFamily: "Mukta"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: displayWidth(context) * 0.7,
                    child: const Text(
                      "Your order is successful !",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: "Mukta"),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: displayWidth(context) * 0.7,
                  child: Text(
                    "Thanks for your order !\nWe hope you enjoy your new purchase!",
                    style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: displayWidth(context) * 0.4,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xfbf09819),
                        Color(0xfbedde5d),
                      ],
                    ),
                  ),
                  child: const Text(
                    "Shop More",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: displayWidth(context) * 0.4,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xfb606c88),
                        Color(0xfb3f4c6b),
                      ],
                    ),
                  ),
                  child: const Text(
                    "My Orders",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
