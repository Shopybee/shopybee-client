import 'package:flutter/material.dart';
import 'package:shopybee/uitls/device_size.dart';

class SearchBox extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: displayHeight(context) * 0.07,
        width: displayWidth(context) * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(
              Icons.search,
              color: Colors.red,
            ),
            SizedBox(
              width: 8,
            ),
            Text('Search products...')
          ],
        ),
      ),
    );
  }
}
