import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/view/ui_blocks/address_box.dart';

class AddressBookModalSheet extends StatelessWidget {
  final Logger logger = Logger('AddressBookModalSheet');

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
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
