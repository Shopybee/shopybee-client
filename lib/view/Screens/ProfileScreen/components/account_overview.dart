import 'package:flutter/material.dart';
import 'package:shopybee/uitls/custom_icons/account_overview_custom_icons.dart';

class AccountOverViewBox extends StatelessWidget {
  overviewCard(Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.new_label_outlined,
            color: Colors.blue,
          ),
        ),
      ),
      title: Text(
        'My Orders',
        style: TextStyle(
            color: Colors.black54,
            //fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: "Mukta"),
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
        SizedBox(
          height: 8,
        ),
        overviewCard(Colors.blue.shade100),
        overviewCard(Colors.green.shade100),
        overviewCard(Colors.teal.shade100),
        overviewCard(Colors.yellow.shade100),
        overviewCard(Colors.pink.shade100),
      ],
    );
  }
}
