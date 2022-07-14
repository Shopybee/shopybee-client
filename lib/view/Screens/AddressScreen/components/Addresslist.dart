import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/ui_blocks/address_box.dart';

class AddressList extends StatelessWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserDetailProvider>(context);
    return (controller.getAddresses().isNotEmpty)
        ? ListView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10),
            itemCount: controller.getAddresses().length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    controller.setSelectedAddress(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: AddressBox(
                        isSelected: index == controller.selectedAddressIndex,
                        addressModel: controller.getAddresses()[index]),
                  ));
            })
        : const Text("No addresses saved");
  }
}
