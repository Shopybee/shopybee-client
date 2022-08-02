import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/category_controller.dart';
import 'package:shopybee/uitls/device_size.dart';

class Categories extends StatelessWidget {
  Logger logger = Logger('Categories');

  catrgoryCard(BuildContext context, int index) {
    return Consumer<CategoryController>(
      builder: (context, controller, child) {
        return InkWell(
          onTap: () {
            switch (controller.categories[index].name) {
              case "Mobile":
                Navigator.pushNamed(context, '/mobileCategory');
                break;
              default:
                print("Something");
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: displayWidth(context) * 0.08,
                backgroundColor: Colors.orange[100]!.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.network(controller.categories[index].image),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: displayWidth(context) * 0.2,
                child: Text(
                  controller.categories[index].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 15, fontFamily: "Mukta"),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) * 0.28,
      width: displayWidth(context),
      child: Consumer<CategoryController>(
        builder: (context, controller, child) {
          if (controller.categoryStatus == CategoryStatus.notFetched) {
            controller.getAllCategories();
          }

          switch (controller.categoryStatus) {
            case CategoryStatus.notFetched:
              controller.getAllCategories();
              return Text("Not fetched");

            case CategoryStatus.fetched:
              return GridView.builder(
                  itemCount: controller.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return catrgoryCard(context, index);
                  });

            case CategoryStatus.fetching:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
