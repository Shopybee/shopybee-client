import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/models/UserModel.dart';
import 'package:shopybee/services/api/delete_service.dart';
import 'package:shopybee/services/api/get_service.dart';
import 'package:shopybee/services/api/post_service.dart';
import 'package:shopybee/services/api/put_service.dart';
import 'package:shopybee/services/api/update_service.dart';

class UserDetailProvider extends ChangeNotifier {
  final Logger logger = Logger('UserDetailProvider');
  final PutService _putService = PutService();
  final PostService _postService = PostService();
  final UpdateService _updateService = UpdateService();
  final GetService _getService = GetService();
  final DeleteService _deleteService = DeleteService();

  // screen controlling variables

  bool fetchedAddresses = false;

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
    logger.info("User set to : ${user!.name}");
    notifyListeners();
  }

  setAdderesses() async {
    fetchedAddresses = false;
    List<AddressModel> tempList = [];
    try {
      final response =
          await _getService.get(endUrl: 'address/get-by-user-id/${user!.id}');
      if (response.statusCode == 200) {
        tempList = addressListFromMap(response.body.toString());
      }
      addresses = tempList;
    } catch (error) {
      logger.severe(error.toString());
      logger.fine('Addresses set : ${addresses.length}');
    }
    fetchedAddresses = true;
    setSelectedAddress(null);
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

  createNewAddress(AddressModel addressModel) async {
    try {
      final response = await _postService.post(
          endUrl: 'address/create',
          jsondata: json.encode(addressModel.toMap()),
          showMessage: true);
      if (response.statusCode == 200) {
        AddressModel savedAddress =
            AddressModel.fromMap(json.decode(response.body));
        addresses.add(savedAddress);
      }
    } catch (error) {
      logger.severe(error.toString());
    }
    notifyListeners();
  }

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
