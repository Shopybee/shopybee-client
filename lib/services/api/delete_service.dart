import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shopybee/constants/constants.dart';

class DeleteService {
  Logger logger = Logger('DeleteService');
  Future<String> delete({
    required String endUrl,
  }) async {
    String status = "";
    try {
      final response = await http.delete(
        Uri.parse(baseUrl + endUrl),
      );
      switch (response.statusCode) {
        case 200:
          status = "OK";
          break;
        default:
          return "";
      }
    } catch (error) {
      logger.shout(error);
    }
    return status;
  }
}
