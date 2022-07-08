import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/UserModel.dart';
import 'package:shopybee/services/api/put_service.dart';

class UserProvider extends ChangeNotifier {
  final Logger logger = Logger('UserProvider');
  final PutService _putService = PutService();
  UserModel? user;

  registerNewUser({required String id, String? name, String? email}) async {
    try {
      final response = await _putService.put(
          endUrl: 'users/$id.json',
          data: {
            'name': name ?? 'New User',
            'email': email,
            'id': id,
          },
          showMessage: true,
          message: "Account created successfully");
      return response;
    } catch (error) {
      logger.severe(error.toString());
    }
  }
}
