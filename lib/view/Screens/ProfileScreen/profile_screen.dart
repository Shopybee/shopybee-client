import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopybee/services/firebase/auth_services.dart';
import 'package:shopybee/uitls/device_size.dart';
import 'package:shopybee/view/Screens/ProfileScreen/components/account_overview.dart';
import 'package:shopybee/view/Screens/ProfileScreen/components/profile_box.dart';

class ProfileScreen extends StatelessWidget {
  final Authservice _auth = Authservice(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context),
      width: displayWidth(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/26/47/62/2647624ed5ad7274676372e560210249.jpg'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileBox(),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(16),
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
