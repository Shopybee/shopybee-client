import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/models/UserModel.dart';
import 'package:shopybee/services/api/delete_service.dart';
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
  final DeleteService _deleteService = DeleteService();
  int selectedAddressIndex = -1;
  UserModel? user;
  List<AddressModel> addresses = [];

  // getters

  List<AddressModel> getAddresses() {
    return [...addresses];
  }

  // setters

  setUser(UserModel userFromServer) async {
    user = userFromServer;
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

  setSelectedAddress(int? index) {
    if (index != null) {
      selectedAddressIndex = index;
    } else {
      selectedAddressIndex = 0;
    }
    logger.fine('Selected address set to : $selectedAddressIndex');
    notifyListeners();
  }

  // createNewAddress(String userId, AddressModel addressModel) async {
  //   try {
  //     final postResponse = await _postService.post(
  //         endUrl: 'addresses/$userId.json',
  //         data: addressModel.toJson(),
  //         showMessage: false);
  //     if (postResponse != null) {
  //       Map<String, dynamic> responseBody = getResponseBody(postResponse);
  //       final String addressId = responseBody['name'];
  //       final updateResponse = await _updateService.update(
  //           endUrl: 'addresses/$userId/$addressId.json',
  //           data: {'id': addressId},
  //           showMessage: true,
  //           message: "Address saved successfully");
  //       if (updateResponse.statusCode == 200) {
  //         addresses.add(AddressModel(
  //             name: addressModel.name,
  //             city: addressModel.city,
  //             id: addressId,
  //             phone: addressModel.phone,
  //             state: addressModel.state,
  //             pincode: addressModel.pincode,
  //             addressLine: addressModel.addressLine,
  //             landmark: addressModel.landmark));
  //       }
  //     }
  //   } catch (error) {
  //     logger.severe(error.toString());
  //   }
  //   notifyListeners();
  // }

  login({required String email, required String password}) async {
    try {
      final response = await _postService.post(
        endUrl: 'user/login',
        jsondata: json.encode({'email': email, 'password': password}),
        showMessage: true,
      );
      if (response.statusCode == 200) {
        UserModel user = userModelFromMap(response.body.toString());
        setUser(user);
        return "OK";
      }
    } catch (error) {}
    return "NOT-OK";
  }

  registerNewUser({
    required UserModel user,
  }) async {
    try {
      final response = await _postService.post(
          endUrl: 'user/register',
          jsondata: userModelToMap(user),
          showMessage: true,
          message: "Account created successfully");

      if (response.statusCode == 200) {
        UserModel user = userModelFromMap(response.body.toString());
        setUser(user);
        return "OK";
      }
    } catch (error) {
      logger.severe(error.toString());
    }
    return "NOT-OK";
  }

  removeAddress({required int addressIndex}) async {
    try {
      final String response = await _deleteService.delete(
          endUrl: "addresses/${user!.id}/${addresses[addressIndex].id}.json");

      if (response.isNotEmpty) {
        addresses.removeAt(addressIndex);
      }
    } catch (error) {
      logger.severe(error.toString());
    }
    notifyListeners();
  }
}
