import 'package:flutter/material.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/models/MobileModel.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/Products/Mobiles/MobileDetailDisplay/components/change_address_bar.dart';
import 'package:shopybee/view/Screens/Products/Mobiles/MobileDetailDisplay/components/details.dart';
import 'package:shopybee/view/Screens/Products/Mobiles/MobileDetailDisplay/components/mobile_images.dart';

class MobileDetailDisplay extends StatelessWidget {
  MobileModel mobile;

  MobileDetailDisplay({required this.mobile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Container(
          height: displayHeight(context) * 0.05,
          width: displayWidth(context) * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.search,
                color: Colors.black54,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Search for mobiles',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomSheet: Container(
        height: displayHeight(context) * 0.065,
        width: displayWidth(context),
        color: primaryColor,
        alignment: Alignment.center,
        child: const Text(
          'ADD TO CART',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ChangeAddressBar(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
              child: Text(
                mobile.name,
                style: const TextStyle(fontSize: 16, fontFamily: "Mukta"),
              ),
            ),
            MobileImages(images: mobile.images.split(',').toList()),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('\u{20B9}'),
                Text(
                  '${mobile.price - mobile.discount}',
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  const Text('M.R.P: '),
                  Text(
                    '\u{20B9} ${mobile.price}',
                    style:
                        const TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${((mobile.discount / mobile.price) * 100).truncate()}% off',
                    style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            Details(
              mobile: mobile,
            ),
          ],
        ),
      ),
    );
  }
}
