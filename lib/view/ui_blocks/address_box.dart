import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/providers/user_detail_provider.dart';
import 'package:shopybee/uitls/device_size.dart';

class AddressBox extends StatelessWidget {
  final AddressModel addressModel;
  final bool isSelected;
  AddressBox({required this.isSelected, required this.addressModel});
  final Logger _logger = Logger('AddressBox');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: displayWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: displayWidth(context) * 0.15,
            padding: const EdgeInsets.only(top: 2),
            child: const Icon(Icons.home_outlined),
          ),
          SizedBox(
            width: displayWidth(context) * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name of the person who will receive the delivery
                Text(
                  addressModel.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Mukta",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Address line 1 : Can be flat number , house number etc .
                SizedBox(
                    width: displayWidth(context) * 0.6,
                    child: Text(
                      addressModel.addressLine,
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
                  style: TextStyle(fontFamily: "PTSerif"),
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
          ),
          Expanded(
              child: (isSelected)
                  ? Icon(
                      Icons.check,
                      color: Colors.teal,
                      size: 25,
                    )
                  : SizedBox())
        ],
      ),
    );
  }
}
