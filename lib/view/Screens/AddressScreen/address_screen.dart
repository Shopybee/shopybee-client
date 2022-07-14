import 'package:flutter/material.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AddressScreen/components/Addresslist.dart';
import 'package:shopybee/view/Screens/AddressScreen/components/addnewadd.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Addresses",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Mukta",
              fontSize: displayWidth(context) * 0.045,
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Done",
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: "Mukta",
                    fontSize: displayWidth(context) * 0.045,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.05,
              width: displayWidth(context),
            ),
            Container(
              height: displayHeight(context) * 0.7,
              width: displayWidth(context),
              child: AddressList(),
            ),
            AddNewAddress(),
          ],
        ),
      ),
    );
  }
}
