import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/display_mobiles_controller.dart';
import 'package:shopybee/models/MobileModel.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/Products/Mobiles/MobileDetailDisplay/mobile_display.dart';

import '../../../../../constants/constants.dart';

class DisplayMobiles extends StatelessWidget {
  final int brandId;
  DisplayMobiles({required this.brandId});
  Logger _logger = Logger("DisplayMobiles");

  mobileCard(MobileModel mobile) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MobileDetailDisplay(mobile: mobile),));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              mobile.mainImage,
              height: displayHeight(context) * 0.2,
              fit: BoxFit.contain,
            ),
            Container(
              width: displayWidth(context) * 0.5,
              height: displayHeight(context) * 0.2,
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              // color: Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mobile.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        mobile.price.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.5,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '\u{20B9}${mobile.price - mobile.discount}',
                        style: const TextStyle(
                          fontSize: 16.5,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${((mobile.discount / mobile.price) * 100).truncate()}% off',
                        style: const TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Free delivery',
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Card(
                elevation: 0.6,
                child: IconButton(
                  color: Colors.grey.shade400,
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                ),
                shape: const CircleBorder(),
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
            ))
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text("Mobiles"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort_outlined))
        ],
      ),
      backgroundColor: Colors.white,
      body: Consumer<DisplayMobileController>(
        builder: (context, controller, child) {
          if (!controller.status.containsKey(brandId) ||
              controller.status[brandId] == DisplayMobileStatus.notFetched) {
            controller.getAllMobilesByBrand(brandId);
          }
          switch (controller.status[brandId]) {
            case DisplayMobileStatus.fetched:
              return ListView.builder(
                itemCount: controller.listOfMobiles[brandId]!.length,
                itemBuilder: (context, index) {
                  return mobileCard(controller.listOfMobiles[brandId]![index]);
                },
              );
            case DisplayMobileStatus.fetching:
              return const CircularProgressIndicator();

            case DisplayMobileStatus.notFetched:
              return const Text("Tap to fetch1");
            default:
              return const Text("Tap to fetch2");
          }
        },
      ),
    );
  }
}
