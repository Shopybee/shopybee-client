import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shopybee/constants/constants.dart';

class GetService {
  Logger logger = Logger('GetService');
  Future<dynamic> get({
    required String endUrl,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + endUrl),
      );
      logger.info("Get response : ${response.body.toString()}");
      switch (response.statusCode) {
        case 200:
          return response;
        default:
          return response;
      }
    } catch (error) {
      logger.shout(error);
    }
  }
}
