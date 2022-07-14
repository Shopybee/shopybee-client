import 'package:flutter/material.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/AddressScreen/components/Addresslist.dart';
import 'package:shopybee/view/ui_blocks/primaryButton.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: PrimaryButton(
            text: "+ Add New Address",
            height: displayHeight(context) * 0.06,
            width: displayWidth(context) * 0.6,
            fontSize: 15,
            callBack: () {
              Navigator.pushNamed(context, '/addAddress');
            }),
        backgroundColor: Color(0xfbFAF9F6),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Address book",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Mukta",
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.02,
            ),
            const Expanded(child: AddressList()),
          ],
        ));
  }
}
