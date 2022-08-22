import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
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

Future<String> generateOrderId(String key, String secret, double amount) async {
  var authn = 'Basic ${base64Encode(utf8.encode('$key:$secret'))}';

  var headers = {
    'content-type': 'application/json',
    'Authorization': authn,
  };

  var data =
      '{ "amount": $amount, "currency": "INR", "receipt": "receipt#R1", "payment_capture": 1 }'; // as per my experience the receipt doesn't play any role in helping you generate a certain pattern in your Order ID!!

  var res = await http.post(Uri.parse('https://api.razorpay.com/v1/orders'),
      headers: headers, body: data);
  if (res.statusCode != 200) {
    throw Exception('http.post error: statusCode= ${res.statusCode}');
  }

  return json.decode(res.body)['id'].toString();
}

