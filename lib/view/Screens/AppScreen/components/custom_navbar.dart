import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/constants/constants.dart';
import 'package:shopybee/controllers/app_screen_controller.dart';
import 'package:shopybee/services/navbar_icons/navbar_icons.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerL = Provider.of<AppScreenController>(context);
    final controller = Provider.of<AppScreenController>(context, listen: false);
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: controllerL.getIndex,
        onTap: (index) => controller.changeIndex(index),
        elevation: 4,
        selectedItemColor: primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontFamily: "mutka",
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
