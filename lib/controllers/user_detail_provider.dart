import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/AddressModel.dart';
import 'package:shopybee/models/CartItemModel.dart';
import 'package:shopybee/models/CartModel.dart';
import 'package:shopybee/models/UserModel.dart';
import 'package:shopybee/services/api/delete_service.dart';
import 'package:shopybee/services/api/get_service.dart';
import 'package:shopybee/services/api/post_service.dart';
import 'package:shopybee/services/api/put_service.dart';
import 'package:shopybee/services/api/update_service.dart';
import 'package:shopybee/uitls/enums.dart';

class UserDetailProvider extends ChangeNotifier {
  CartStatus cartStatus = CartStatus.notFetched;
  List<CartModel> cart = [];
  final Logger logger = Logger('UserDetailProvider');
  final PutService _putService = PutService();
  final PostService _postService = PostService();
  final UpdateService _updateService = UpdateService();
  final GetService _getService = GetService();
  final DeleteService _deleteService = DeleteService();
  AddressStatus addressStatus = AddressStatus.notFetched;

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

  setAddressStatus(AddressStatus updated) {
    addressStatus = updated;
  }

  setUser(UserModel userFromServer) async {
    user = userFromServer;
    logger.info("User set to : ${user!.name}");
    notifyListeners();
  }

  setAdderesses() async {
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
    setAddressStatus(AddressStatus.ok);
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
    setAddressStatus(AddressStatus.creating);
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
    setAddressStatus(AddressStatus.ok);
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
    setAddressStatus(AddressStatus.deleting);
    try {
      final response = await _deleteService.delete(
          endUrl: 'address/delete/${addresses[addressIndex].id}');
      if (response.statusCode == 200) {
        addresses.removeAt(addressIndex);
      }
    } catch (error) {
      logger.severe(error.toString());
    }
    setAddressStatus(AddressStatus.ok);
    notifyListeners();
  }

  updateAddress(AddressModel updateAddress) async {
    try {
      final response = await _putService.put(
          endUrl: 'address/update',
          jsondata: jsonEncode(updateAddress.toMap()),
          showMessage: true);
      if (response.statusCode == 200) {}
    } catch (error) {
      logger.severe(error.toString());
    }
  }

  //****   User cart   *************/

  setCartStatus(CartStatus updatedStatus) {
    cartStatus = updatedStatus;
  }

  getCart() async {
    setCartStatus(CartStatus.fetching);
    try {
      final response = await _getService.get(
          endUrl: 'cart/get-cart-items-by-user-id/${user!.id}');
      if (response.statusCode == 200) {
        cart = cartModelFromMap(response.body.toString());
      }
    } catch (error) {
      logger.shout(error.toString());
    }
    setCartStatus(CartStatus.fetched);
    notifyListeners();
  }

  addToCart(int categoryId, int brandId, int productId) async {
    setCartStatus(CartStatus.fetching);
    notifyListeners();
    try {
      final response = await _postService.post(
          endUrl: 'cart/add-to-cart',
          jsondata: jsonEncode({
            'quantity': 1,
            'brandId': brandId,
            'categoryId': categoryId,
            'productId': productId,
            'userId': user!.id,
          }),
          showMessage: true);
      if (response.statusCode == 200) {
        CartModel addedItem = CartModel.fromMap(jsonDecode(response.body));
        cart.add(addedItem);
      }
    } catch (error) {
      logger.shout(error.toString());
    }
    setCartStatus(CartStatus.fetched);
    notifyListeners();
  }

  updateCart(int index, int cartId, int quantity, int categoryId, int brandId,
      int productId) async {
    setCartStatus(CartStatus.fetching);
    notifyListeners();
    try {
      final response = await _putService.put(
          endUrl: 'cart/update-cart',
          jsondata: jsonEncode({
            'cartId': cartId,
            'quantity': quantity,
            'brandId': brandId,
            'categoryId': categoryId,
            'productId': productId,
            'userId': user!.id,
          }),
          showMessage: false);
      if (response.statusCode == 200) {
        CartModel addedItem = CartModel.fromMap(jsonDecode(response.body));
        cart.removeAt(index);
        cart.insert(index, addedItem);
      }
    } catch (error) {
      logger.shout(error.toString());
    }
    setCartStatus(CartStatus.fetched);
    notifyListeners();
  }

  removeItemFromCart(int cartId) async {
    setCartStatus(CartStatus.fetching);
    notifyListeners();
    try {
      final response =
          await _deleteService.delete(endUrl: 'cart/remove-from-cart/$cartId');
      if (response.statusCode == 200) {
        cart.removeWhere((item) => item.cartId == cartId);
      }
    } catch (error) {
      logger.shout(error.toString());
    }
    setCartStatus(CartStatus.fetched);
    notifyListeners();
  }

  //*** Cart Item Controllers  ****/

  Map<int, CartItemStatus> cartItemStatus = {};
  Map<int, CartItemModel> cartItems = {};

  setCartItemStatus(int productId, CartItemStatus updated) {
    cartItemStatus[productId] = updated;
  }

  getCartItem(int categoryId, int brandId, int productId) async {
    setCartItemStatus(productId, CartItemStatus.fetching);
    try {
      final response = await _getService.get(
          endUrl: 'cart/get-cart-item/$categoryId/$brandId/$productId');
      if (response.statusCode == 200) {
        CartItemModel cartItem = cartItemModelFromMap(response.body.toString());
        cartItems[productId] = cartItem;
      }
    } catch (error) {
      logger.shout(error.toString());
    }
    setCartItemStatus(productId, CartItemStatus.fetched);
    notifyListeners();
  }
}
