class OrderModel{
  final String productId;
  final String quantity;
  final String status; // ['Placed','Shipped','Out for delivery','Delivered']
  final String id;

  OrderModel({required this.productId, required this.quantity, required this.id,required this.status});

  factory OrderModel.fromJson(Map<String,dynamic> json){
    return OrderModel(productId: json['productId'], quantity: json['quantity'], id: json['id'],
    status: json['status']);
  }
}