import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:shopybee/models/OrderModel.dart';
import 'package:shopybee/services/api/get_service.dart';
import 'package:shopybee/services/api/post_service.dart';
import 'package:shopybee/uitls/enums.dart';

class OrderController with ChangeNotifier {
  GetService _getService = GetService();
  PostService _postService = PostService();
  Logger _logger = Logger("OrderController");
  OrderScreenNavigationStatus navigationStatus =
      OrderScreenNavigationStatus.address;

  List<OrdersModel> orders = [];
  bool usingShopcons = false;

  CreatingOrderStatus creatingOrderStatus = CreatingOrderStatus.notFetched;

  setCreatingOrderStatus(CreatingOrderStatus updated) {
    creatingOrderStatus = updated;
    // notifyListeners();
  }

  useShopcons() {
    usingShopcons = true;
    notifyListeners();
  }

  dontUseShopcons() {
    usingShopcons = false;
    notifyListeners();
  }

  setNavigationStatus(OrderScreenNavigationStatus updated) {
    navigationStatus = updated;
    notifyListeners();
  }

  getOrdersUsingUserId(int userId) async {
    setCreatingOrderStatus(CreatingOrderStatus.fetching);

    try {
      final Response response =
          await _getService.get(endUrl: 'order/get-all-orders/$userId');
      if (response.statusCode == 200) {
        orders = ordersModelFromMap(response.body.toString());
      }
    } catch (error) {
      _logger.shout(error.toString());
    }
    setCreatingOrderStatus(CreatingOrderStatus.fetched);
    notifyListeners();
  }

  createNewOrder({
    required String orderId,
    required String paymentId,
    required DateTime orderDate,
    required int userId,
    required double totalAmount,
    required int orderStatus,
    required String orderStatusMessage,
    required List<OrderItemList> orderItemList,
  }) async {
    OrdersModel ordersModel = OrdersModel(
        orderId: orderId,
        paymentId: paymentId,
        orderDate: orderDate,
        userId: userId,
        totalAmount: totalAmount,
        orderStatus: orderStatus,
        orderStatusMessage: orderStatusMessage,
        orderItemList: orderItemList);
    try {
      final Response response = await _postService.post(
          endUrl: 'order/create-order',
          jsondata: ordersModelToMap(ordersModel),
          showMessage: true,
          message: "Some message ");
      if (response.statusCode == 200) {
        _logger.info("Order placed !!");
      }
    } catch (error) {
      _logger.shout(error.toString());
    }
  }
}
