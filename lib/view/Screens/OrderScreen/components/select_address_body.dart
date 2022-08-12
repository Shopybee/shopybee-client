import 'package:flutter/material.dart';
import 'package:shopybee/view/Screens/AddressScreen/components/Addresslist.dart';

class SelectAddressBody extends StatelessWidget {
  const SelectAddressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Deliver to: ",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Mukta"),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: AddressList())
        ],
      ),
    );
  }
}
