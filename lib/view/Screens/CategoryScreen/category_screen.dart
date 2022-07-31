import 'package:flutter/material.dart';
import 'package:shopybee/view/Screens/CategoryScreen/components/categories.dart';
import 'package:shopybee/view/ui_blocks/body_with_appbar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWithAppBar(
      body: ListView(
        padding: const EdgeInsets.only(top: kToolbarHeight),
        children: [
          const SizedBox(height: 20),
          Categories(),
        ],
      ),
    );
  }
}
