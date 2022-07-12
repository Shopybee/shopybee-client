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
      switch (response.statusCode) {
        case 200:
          return response;
        default:
          return null;
      }
    } catch (error) {
      logger.shout(error);
    }
  }
}
