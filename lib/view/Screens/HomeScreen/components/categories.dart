import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/uitls/device_size.dart';

class Categories extends StatelessWidget {
  Logger logger = Logger('Categories');

  catrgoryCard(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        logger.info(categories[index].label);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: displayWidth(context) * 0.08,
            backgroundColor: categories[index].bgcolor,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Image.asset(categories[index].image),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: displayWidth(context) * 0.2,
            child: Text(
              categories[index].label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black, fontSize: 15, fontFamily: "Mukta"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: displayHeight(context) * 0.28,
      width: displayWidth(context),
      child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (BuildContext context, int index) {
            return catrgoryCard(context, index);
          }),
    );
  }
}
