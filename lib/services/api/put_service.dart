import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shopybee/constants/constants.dart';

class PutService {
  Logger logger = Logger('PutService');
  Future<dynamic> put(
      {required String endUrl,
      required String jsondata,
      String? message,
      required bool showMessage}) async {
    logger.info("Put Body : $jsondata");
    try {
      final response = await http.put(Uri.parse(baseUrl + endUrl),
          body: jsondata, headers: {'Content-Type': "application/json"});
      logger.info('Put response :${response.body}');
      switch (response.statusCode) {
        case 200:
          return response;

        case 400:
          break;
      }
    } catch (error) {
      logger.shout(error);
    }
  }
}
