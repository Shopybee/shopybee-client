import 'package:flutter/material.dart';
import 'package:shopybee/view/ui_blocks/address_box.dart';

class AddressBookModalSheet extends StatelessWidget {
  const AddressBookModalSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
      child: Column(
        children: [
          const Text('Address book',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Mukta',
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return  Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: AddressBox(),
              );
            },
          ))
        ],
      ),
    );
  }
}
