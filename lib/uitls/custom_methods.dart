import 'package:flutter/material.dart';

import 'device_size.dart';

Widget fetchingAppBarAddress() {
  return CircularProgressIndicator();
}

Widget notFetchedAddress() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return SizedBox(
            width: displayWidth(context) * 0.35,
            child: const Text('Your Address',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
          );
        }),
      ]);
}

Widget creatingAppBarAddress() {
  return const Center(
    child: Text('creating'),
  );
}

Widget deletingAppBarAddress() {
  return const Center(
    child: Text('delting'),
  );
}

Widget editingAppBarAddress() {
  return const Center(
    child: Text('delting'),
  );
}

Widget okayAppbarAddress(String addressLine, String city, String pincode) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return SizedBox(
            width: displayWidth(context) * 0.35,
            child: Text(addressLine,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Mukta',
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
          );
        }),
        Builder(builder: (context) {
          return SizedBox(
            width: displayWidth(context) * 0.35,
            child: Text(
              '$city, $pincode',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500),
            ),
          );
        })
      ]);
}
