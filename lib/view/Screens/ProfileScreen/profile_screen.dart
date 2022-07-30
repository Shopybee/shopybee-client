import 'package:flutter/material.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/ProfileScreen/components/account_overview.dart';
import 'package:shopybee/view/Screens/ProfileScreen/components/profile_box.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context),
      width: displayWidth(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/profile_background.jpg'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileBox(),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: AccountOverViewBox(),
          ))
        ],
      ),
    );
  }
}
