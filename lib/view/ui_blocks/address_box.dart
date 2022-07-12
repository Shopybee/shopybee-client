import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/uitls/device_size.dart';

class AddressBox extends StatelessWidget {
  final AddressModel addressModel;
  AddressBox({required this.addressModel});
  final Logger _logger = Logger('AddressBox');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: displayWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name of the person who will receive the delivery
          const Text(
            'Subhojeet Sahoo',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          // Address line 1 : Can be flat number , house number etc .
          SizedBox(
              width: displayWidth(context) * 0.6,
              child: Text(
                '${addressModel.addressLine}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          const SizedBox(
            height: 2,
          ),
          // City + State + Pincode
          Text(
            '${addressModel.city}, ${addressModel.state} ${addressModel.pincode}',
          ),
          const SizedBox(
            height: 2,
          ),
          // Country
          const Text(
            'INDIA',
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Phone number: ${addressModel.phone}',
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  _logger.info('Edit button pressed');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit,
                      size: 17,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _logger.info('Delete button pressed');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.delete_forever,
                      size: 17,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
