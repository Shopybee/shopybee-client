import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/models/UserModel.dart';
import 'package:shopybee/services/api/get_service.dart';
import 'package:shopybee/services/api/post_service.dart';
import 'package:shopybee/services/api/put_service.dart';
import 'package:shopybee/services/api/update_service.dart';
import 'package:shopybee/uitls/custom_methods.dart';

class UserDetailProvider extends ChangeNotifier {
  final Logger logger = Logger('UserDetailProvider');
  final PutService _putService = PutService();
  final PostService _postService = PostService();
  final UpdateService _updateService = UpdateService();
  final GetService _getService = GetService();
  UserModel? user;
  List<AddressModel> addresses = [];

  // getters

  List<AddressModel> getAddresses() {
    return [...addresses];
  }

  // setters

  setUser(String uid) async {
    try {
      dynamic response = await _getService.get(endUrl: 'users/$uid.json');
      if (response != null) {
        Map<String, dynamic> responseBody = getResponseBody(response);
        user = UserModel.fromJson(responseBody);
        logger.fine('User set to ${user!.name}');
      }
    } catch (error) {
      logger.severe(error.toString());
    }

    notifyListeners();
  }

  setAdderesses() async {
    List<AddressModel> temp = [];
    try {
      dynamic response =
          await _getService.get(endUrl: 'addresses/${user!.id}.json');
      if (response != null) {
        Map<String, dynamic> responseBody = getResponseBody(response);
        if (responseBody.isNotEmpty) {
          responseBody.forEach((key, value) {
            temp.add(AddressModel.fromJson(value));
          });
          addresses = temp;
        }
      }
    } catch (error) {
      logger.severe(error.toString());
    }
    logger.fine('Addresses set : ${addresses.length}');
    notifyListeners();
  }

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
              name: addressModel.name,
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

  registerNewUser(
      {required String id,
      required String name,
      required String email,
      required String phone}) async {
    try {
      final response = await _putService.put(
          endUrl: 'users/$id.json',
          data: {
            'name': name,
            'email': email,
            'id': id,
            'phone': phone,
          },
          showMessage: true,
          message: "Account created successfully");
      return response;
    } catch (error) {
      logger.severe(error.toString());
    }
  }
}
