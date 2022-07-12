import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shopybee/constants/constants.dart';

class UpdateService {
  Logger logger = Logger('UpdateService');
  Future<dynamic> update(
      {required String endUrl,
      required Map<String, dynamic> data,
      String? message,
      required bool showMessage}) async {
    try {
      final response = await http.patch(Uri.parse(baseUrl + endUrl),
          body: json.encode(data));
      switch (response.statusCode) {
        case 200:
          return response;
      }
    } catch (error) {
      logger.shout(error);
    }
  }
}