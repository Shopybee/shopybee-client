import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/mobile_category_screen_controller.dart';
import 'package:shopybee/models/MobileCategoryModel.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/Products/Mobiles/MobileListDisplay/mobile_pd.dart';

class MobileCategoryScreen extends StatelessWidget {
  final Logger logger = Logger("MobileCategoryScreen");

  mobilecCategoryCard(int index) {
    return Consumer<MobileCategoryScreenController>(
      builder: (context, controller, child) {
        MobileCategoryModel categoryModel =
            controller.mobileCategoryList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DisplayMobiles(brandId: categoryModel.brandId),
                ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: displayWidth(context) * 0.1,
                backgroundColor: Colors.orange[100]!.withOpacity(0.3),
                backgroundImage: NetworkImage(categoryModel.logo),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                categoryModel.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Mukta"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Shopybee Mobiles"),
            backgroundColor: primaryColor,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined))
            ],
          ),
          body: Consumer<MobileCategoryScreenController>(
            builder: (context, controlller, child) {
              if (controlller.mobileCategoryStatus ==
                  MobileCategoryStatus.notFetched) {
                controlller.getAllCategories();
              }
              switch (controlller.mobileCategoryStatus) {
                case MobileCategoryStatus.notFetched:
                  return const Text('Tap to fetch');

                case MobileCategoryStatus.fetching:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case MobileCategoryStatus.fetched:
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: displayHeight(context) * 0.17,
                          width: displayWidth(context),
                          // color: Colors.black12,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controlller.mobileCategoryList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, right: 15),
                                child: mobilecCategoryCard(index),
                              );
                            },
                          ),
                        ),
                        // Thinking to post some banners here
                        Image.network(
                          'https://i.pinimg.com/originals/ea/bd/aa/eabdaadef69a169117a2900e77bfde9f.jpg',
                          height: displayHeight(context) * 0.25,
                          width: displayWidth(context),
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.network(
                          'https://www.devicespecifications.com/images/news/fd52a42/additional_0.jpg',
                          height: displayHeight(context) * 0.3,
                          width: displayWidth(context),
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Image.network(
                          'https://rukminim1.flixcart.com/flap/844/140/image/4e92c50404ea7abe.jpg?q=50',
                          height: displayHeight(context) * 0.25,
                          width: displayWidth(context),
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  );
              }
            },
          )),
    );
  }
}
