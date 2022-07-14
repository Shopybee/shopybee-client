import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/ui_blocks/address_box.dart';

class AddressList extends StatelessWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerL = Provider.of<UserDetailProvider>(context);
    return (controllerL.getAddresses().isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: controllerL.getAddresses().length,
                itemBuilder: (context, index) {
                  return AddressBox(
                      addressModel: controllerL.getAddresses()[index]);
                }),
          )
        : Text("No addresses saved");
  }
}
