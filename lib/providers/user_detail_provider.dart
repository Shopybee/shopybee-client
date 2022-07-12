import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/models/UserModel.dart';
import 'package:shopybee/services/api/post_service.dart';
import 'package:shopybee/services/api/put_service.dart';
import 'package:shopybee/services/api/update_service.dart';
import 'package:shopybee/uitls/custom_methods.dart';

class UserDetailProvider extends ChangeNotifier {
  final Logger logger = Logger('UserDetailProvider');
  final PutService _putService = PutService();
  final PostService _postService = PostService();
  final UpdateService _updateService = UpdateService();
  UserModel? user;
  List<AddressModel> addresses = [];

  // getters

  List<AddressModel> getAddresses({required String id}) {
    return [...addresses];
  }

  // setters

  createNewAddress(String userId, AddressModel addressModel) async {
    try {
      final postResponse = await _postService.post(
          endUrl: 'addresses/$userId.json',
          data: addressModel.toJson(),
          showMessage: false);
      if (postResponse != null) {
        Map<String, dynamic> responseBody = getResponseBody(postResponse);
        final String addressId = responseBody['name'];
        final updateResponse = await _updateService.update(
            endUrl: 'addresses/$userId/$addressId.json',
            data: {'id': addressId},
            showMessage: true,
            message: "Address saved successfully");
        if (updateResponse.statusCode == 200) {
          addresses.add(AddressModel(
              city: addressModel.city,
              id: addressId,
              phone: addressModel.phone,
              state: addressModel.state,
              pincode: addressModel.pincode,
              addressLine: addressModel.addressLine,
              landmark: addressModel.landmark));
        }
      }
    } catch (error) {
      logger.severe(error.toString());
    }
    notifyListeners();
  }

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
