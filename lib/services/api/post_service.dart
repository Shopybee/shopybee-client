import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shopybee/constants/constants.dart';

class PostService {
  Logger logger = Logger('PostService');
  Future<dynamic> post(
      {required String endUrl,
      required Map<String, dynamic> data,
      String? message,
      required bool showMessage}) async {
    try {
      final response =
          await http.post(Uri.parse(baseUrl + endUrl), body: json.encode(data));
      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          // ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
          //     .showSnackBar(const SnackBar(content: Text('Bad request')));
          return null;
        case 401:
          // ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
          //     .showSnackBar(const SnackBar(content: Text('Unauthorised')));
          return null;
        default:
          // ScaffoldMessenger.of(GlobalContext.contextKey.currentContext!)
          //     .showSnackBar(const SnackBar(
          //         content: Text('Network connectivity problem')));
          return null;
      }
    } catch (error) {
      logger.shout(error);
    }
  }
}
