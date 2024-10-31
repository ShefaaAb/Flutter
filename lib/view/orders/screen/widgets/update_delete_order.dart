import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:products_api/model/orders_model.dart';
import 'package:products_api/view/orders/controller/orders_controller.dart';

void showUpdateDialog(BuildContext context, OrdersController controller, int orderId,String quantity) {
  final TextEditingController quantityController = TextEditingController();

  Get.dialog(
    AlertDialog(
      title: Text('Update Order'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Enter new quantity'),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Current Quantity: $quantity'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final quantity = int.tryParse(quantityController.text);
            if (quantity != null && quantity > 0) {
              controller.updateOrders(orderId.toString(), quantityController.text);
              Get.back();
            } else {
              Get.snackbar('Invalid Input', 'Please enter a valid quantity.');
            }
          },
          child: Text('Update'),
        ),
      ],
    ),
  );
}

void showDeleteDialog(BuildContext context, OrdersController controller, int orderId, Peoduct order) {

  Get.dialog(
    AlertDialog(
      title: Text('Delete Order'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Are you sure you want to delete ${order.name} ?'),

        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            controller.deleteOrders(orderId.toString());

              Get.back();
          },
          child: Text('Delete'),
        ),
      ],
    ),
  );
}