import 'package:flutter/material.dart';
import 'package:shopybee/uitls/device_size.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/addAddress'),
      child: Container(
        height: displayHeight(context) * 0.05,
        width: displayWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: displayWidth(context) * 0.25,
            ),
            Icon(
              Icons.add,
              color: Colors.red,
            ),
            SizedBox(
              width: displayWidth(context) * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.all(0.8),
              child: Text("Add New Addresses",
                  style: TextStyle(
                    fontFamily: "Mukta",
                    color: Colors.red,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
