import 'package:flutter/material.dart';
import 'package:shopybee/models/MobileModel.dart';
import 'package:shopybee/uitls/device_size.dart';

class Details extends StatelessWidget {
  MobileModel mobile;

  Details({required this.mobile});

  detailRow(String key, String value) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(right: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: displayWidth(context) * 0.4,
              child: Text(
                key,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            SizedBox(
              width: displayWidth(context) * 0.4,
              child: Text(
                value,
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          detailRow("Brand", mobile.brand),
          const SizedBox(
            height: 8,
          ),
          detailRow("OS", mobile.operatingSystem),
          const SizedBox(
            height: 8,
          ),
          detailRow("RAM", '${mobile.ram} GB'),
          const SizedBox(
            height: 8,
          ),
          detailRow("Memory Storage", '${mobile.storage} GB'),
          const SizedBox(
            height: 8,
          ),
          detailRow("Front Camera", "${mobile.frontCamera} MP"),
          const SizedBox(
            height: 8,
          ),
          detailRow("Rear Camera", "${mobile.rearCamera} MP"),
          const SizedBox(
            height: 8,
          ),
          detailRow("Screen size", mobile.display),
          const SizedBox(
            height: 8,
          ),
          detailRow("Processor", mobile.processor),
          const SizedBox(
            height: 8,
          ),
          detailRow("Battery Backup", '${mobile.batteryBackup} mAH'),
          const SizedBox(
            height: 8,
          ),
          detailRow("Number of Sim Slots", mobile.simCardSlot),
          const SizedBox(
            height: 8,
          ),
          detailRow("Items in the box", mobile.itemsInBox),
          SizedBox(
            height: displayHeight(context) * 0.08,
          ),
        ],
      ),
    );
  }
}
