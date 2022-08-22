import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logging/logging.dart';

class AccountOverViewBox extends StatelessWidget {
  Logger logger = Logger('AccountOverViewBox');
  overviewCard(
      {required Color cardColor,
      required Icon icon,
      required VoidCallback callback,
      required String label}) {
    return ListTile(
      onTap: callback,
      contentPadding: EdgeInsets.zero,
      leading: Card(
        elevation: 0,
        color: cardColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
      ),
      title: Text(
        label,
        style: const TextStyle(
            color: Colors.black54,
            //fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: "Mukta"),
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
          size: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Account Overview',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: "Mukta",
            fontSize: 19,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        overviewCard(
            cardColor: Colors.blue[100]!,
            icon: Icon(
              FontAwesomeIcons.locationArrow,
              color: Colors.blue[600],
            ),
            callback: () {
              Navigator.pushNamed(context, '/address');
            },
            label: "My Addresses"),
        overviewCard(
            cardColor: Colors.green.shade100,
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.green[300],
            ),
            callback: () {
              logger.fine('My Wishlist');
            },
            label: "My Wishlist"),
        overviewCard(
            cardColor: Colors.yellow[100]!,
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.yellow[600],
            ),
            callback: () {
              Navigator.pushNamed(context, '/myOrders');
            },
            label: "My Orders"),
        overviewCard(
            cardColor: Colors.teal[100]!,
            icon: Icon(
              FontAwesomeIcons.coins,
              color: Colors.teal[400],
            ),
            callback: () {
              logger.fine('Shopcons');
            },
            label: "Shopcons Earned"),
        overviewCard(
            cardColor: Colors.teal[100]!,
            icon: Icon(
              FontAwesomeIcons.coins,
              color: Colors.teal[400],
            ),
            callback: () {
              logger.fine('Shopcons');
            },
            label: "Shopcons Earned"),
        overviewCard(
            cardColor: Colors.teal[100]!,
            icon: Icon(
              FontAwesomeIcons.coins,
              color: Colors.teal[400],
            ),
            callback: () {
              logger.fine('Shopcons');
            },
            label: "Shopcons Earned"),
      ],
    );
  }
}
