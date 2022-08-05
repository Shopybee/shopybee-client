import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/view/ui_blocks/address_box.dart';

class AddressBookModalSheet extends StatelessWidget {
  final Logger logger = Logger('AddressBookModalSheet');

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Address book',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.bold)),
                    TextButton.icon(
                        onPressed: () {
                          logger.info('Clicked on Add new address button');
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/addAddress');
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.black54,
                        ),
                        label: const Text(
                          'New',
                          style: TextStyle(color: Colors.black54),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<UserDetailProvider>(
                  builder: (context, controller, child) {
                    if (controller.addressStatus == AddressStatus.notFetched) {
                      controller.setAddressStatus(AddressStatus.fetching);
                      controller.setAdderesses();
                    }
                    switch (controller.addressStatus) {
                      case AddressStatus.creating:
                        return const Center(
                          child: Text('Create'),
                        );
                      case AddressStatus.editing:
                        return const Center(
                          child: Text('Editing'),
                        );
                      case AddressStatus.notFetched:
                        return const Center(
                          child: Text('Tap to fetch'),
                        );

                      case AddressStatus.fetching:
                        return const Center(
                          child: Text('Fetching'),
                        );

                      case AddressStatus.deleting:
                        return const Center(
                          child: Text('Deleting'),
                        );
                      case AddressStatus.ok:
                        return (controller.getAddresses().isNotEmpty)
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.getAddresses().length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: InkWell(
                                      onTap: () =>
                                          controller.setSelectedAddress(index),
                                      child: AddressBox(
                                          index: index,
                                          addressModel:
                                              controller.getAddresses()[index]),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text(
                                  'No addresses saved',
                                  style: TextStyle(
                                      fontFamily: "Mukta", fontSize: 16),
                                ),
                              );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
      expand: false,
    );
  }
}
