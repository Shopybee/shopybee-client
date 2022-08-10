import 'package:flutter/material.dart';
import 'package:shopybee/uitls/device_size.dart';

class EmpyCartBox extends StatelessWidget {
  const EmpyCartBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: displayWidth(context) * 0.35,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/empty_cart.png',
                height: displayHeight(context) * 0.3,
              )),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Cart Empty",
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade500,
                fontFamily: "Mukta",
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: displayWidth(context) * 0.75,
            child: Text(
              'Add items to your cart and we will get them delivered at your doorsteps',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
            ),
          )
        ],
      ),
    );
  }
}
