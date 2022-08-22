// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromMap(jsonString);

import 'dart:convert';

List<OrdersModel> ordersModelFromMap(String str) =>
    List<OrdersModel>.from(json.decode(str).map((x) => OrdersModel.fromMap(x)));

String ordersModelToMap(OrdersModel data) => json.encode(data.toMap());

class OrdersModel {
  OrdersModel({
    required this.orderId,
    required this.paymentId,
    required this.orderDate,
    required this.userId,
    required this.totalAmount,
    required this.orderStatus,
    required this.orderStatusMessage,
    required this.orderItemList,
  });

  String orderId;
  String paymentId;
  DateTime orderDate;
  int userId;
  double totalAmount;
  int orderStatus;
  String orderStatusMessage;
  List<OrderItemList> orderItemList;

  factory OrdersModel.fromMap(Map<String, dynamic> json) => OrdersModel(
        orderId: json["orderId"],
        paymentId: json["paymentId"],
        orderDate: DateTime.parse(json["orderDate"]),
        userId: json["userId"],
        totalAmount: json["totalAmount"],
        orderStatus: json["orderStatus"],
        orderStatusMessage: json["orderStatusMessage"],
        orderItemList: List<OrderItemList>.from(
            json["orderItemList"].map((x) => OrderItemList.fromMap(x))),
      );

 Map<String, dynamic> toMap() => {
        "orderId": orderId,
        "paymentId": paymentId,
        "orderDate": orderDate.toIso8601String(),
        "userId": userId,
        "totalAmount": totalAmount,
        "orderStatus": orderStatus,
        "orderStatusMessage": orderStatusMessage,
        "orderItemList": List<dynamic>.from(orderItemList.map((x) => x.toMap())),
    };
}

class OrderItemList {
  OrderItemList({
    required this.orderItemId,
    required this.categoryId,
    required this.brandId,
    required this.productId,
    required this.originalPrice,
    required this.discount,
  });

  int orderItemId;
  int categoryId;
  int brandId;
  int productId;
  double originalPrice;
  double discount;

  factory OrderItemList.fromMap(Map<String, dynamic> json) => OrderItemList(
        orderItemId: json["orderItemId"],
        categoryId: json["categoryId"],
        brandId: json["brandId"],
        productId: json["productId"],
        originalPrice: json["originalPrice"],
        discount: json["discount"],
      );

  Map<String, dynamic> toMap() => {
       
        "categoryId": categoryId,
        "brandId": brandId,
        "productId": productId,
        "originalPrice": originalPrice,
        "discount": discount,
      };
}
