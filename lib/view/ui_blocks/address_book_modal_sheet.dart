import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/view/ui_blocks/address_box.dart';

class AddressBookModalSheet extends StatelessWidget {
  final Logger logger = Logger('AddressBookModalSheet');

  @override
  Widget build(BuildContext context) {
    final dataProviderL = Provider.of<UserDetailProvider>(context);
    final dataProvider =
        Provider.of<UserDetailProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
      child: Column(
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
          Expanded(
              child: (dataProviderL.getAddresses().isNotEmpty)
                  ? ListView.builder(
                      itemCount: dataProviderL.getAddresses().length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AddressBox(
                              addressModel:
                                  dataProviderL.getAddresses()[index]),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No addresses saved',
                        style: TextStyle(fontFamily: "Mukta", fontSize: 16),
                      ),
                    ))
        ],
      ),
    );
  }
}
