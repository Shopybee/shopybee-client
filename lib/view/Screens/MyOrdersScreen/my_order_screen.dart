import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopybee/controllers/order_screen_controller.dart';
import 'package:shopybee/controllers/user_detail_provider.dart';
import 'package:shopybee/uitls/enums.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
      ),
      body: Consumer<OrderController>(
        builder: (context, controller, child) {
          if (controller.creatingOrderStatus ==
              CreatingOrderStatus.notFetched) {
            controller.getOrdersUsingUserId(
                Provider.of<UserDetailProvider>(context, listen: false)
                    .user!
                    .id!);
          }
          switch (controller.creatingOrderStatus) {
            case CreatingOrderStatus.fetching:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case CreatingOrderStatus.fetched:
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    controller.orders[index].totalAmount.toString(),
                    style: const TextStyle(color: Colors.black),
                  );
                },
                itemCount: controller.orders.length,
              );
            case CreatingOrderStatus.notFetched:
              return const Text("Not fetched");
          }
        },
      ),
    );
  }
}
