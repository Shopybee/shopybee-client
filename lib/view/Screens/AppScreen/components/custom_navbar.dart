import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/app_screen_controller.dart';
import 'package:shopybee/uitls/custom_icons/navbar_icons.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AppScreenController>(context);

    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: controller.getIndex,
        onTap: (index) => controller.changeIndex(index),
        elevation: 4,
        selectedItemColor: primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontFamily: "Mukta",
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Navbar.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Navbar.cart_plus),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Navbar.user), label: "Profile"),
        ]);
  }
}
