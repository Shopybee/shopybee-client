class OrderModel{
  final String productId;
  final String quantity;
  final String id;

  OrderModel({required this.productId, required this.quantity, required this.id});

  factory OrderModel.fromJson(Map<String,dynamic> json){
    return OrderModel(productId: json['productId'], quantity: json['quantity'], id: json['id']);
  }
}