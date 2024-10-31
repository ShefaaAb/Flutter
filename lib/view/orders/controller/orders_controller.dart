import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:products_api/core/classes/crud.dart';
import 'package:products_api/core/classes/status_request.dart';
import 'package:products_api/core/service/app_link.dart';
import 'package:products_api/model/orders_model.dart';
import 'package:products_api/model/products_model.dart';

class OrdersController extends GetxController{
  var orders = <DetailsOrder>[].obs;
  var cartItemsOrder = <Details>[];

  var status = StatusRequest.loading;
  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  void addCartItemsToOrders(List<Details> items, Map<Details, int> quantities) {
    cartItemsOrder.clear();
    for (var item in items) {
      int quantity = quantities[item] ?? 1;
      for (int i = 0; i < quantity; i++) {
        cartItemsOrder.add(item);
        update();
      }
    }
    items.clear();
    update();
  }

  int orderQuantity(Details order) {
    return cartItemsOrder.where((p) => p == order).length;
  }
  void addToOrder(Details order) {
    cartItemsOrder.add(order);
    update();
  }

  void removeFromOrder(Details order) {
    cartItemsOrder.remove(order);
    update();
  }
  void getOrders() async {
    status = StatusRequest.loading;
    update();
    Either<StatusRequest, Map> result = await Crud().getData(
      AppLink.order,
      getHeadersToken(),
      false,
    );
    result.fold((left) {
      status = left;
      Get.snackbar('Error', status.toString());
      update();
    }, (right) {
      try {
        var ordersList = right['data'];

        if (ordersList is List) {
          print(ordersList);
          orders.value = ordersList.map((json) => DetailsOrder.fromJson(json)).toList();
          print(orders.last.peoduct.name);
          status = StatusRequest.success;
          update();
        } else {
          status = StatusRequest.failure;
          Get.snackbar('Error', "Data is not a list.");
        }
      } catch (e) {
        status = StatusRequest.failure;
        Get.snackbar('Error', "Error parsing order data: $e");
      }
      update();
    });
  }

  void updateOrders(String id, String quantity) async {
    status = StatusRequest.loading;
    update();
    Either<StatusRequest, String> result = await Crud().postData(
      '${AppLink.order}/${id}',
      {
        '_method':'PUT',
        'quantity':quantity
      },
      getHeadersToken(),
      false,
    );
    result.fold((left) {
      status = left;
      Get.snackbar('Message', status.toString());
      getOrders();
      update();
    }, (right) {
      try {
        Get.snackbar('Message', right);

      } catch (e) {
        status = StatusRequest.failure;
        Get.snackbar('Error', "Error parsing order data: $e");
      }
      this.getOrders();
      update();
    });
  }

  void createOrders(String id, String quantity) async {
    status = StatusRequest.loading;
    update();
    Either<StatusRequest, String> result = await Crud().postData(
      AppLink.order,
      {
        'product_id': id,
        'quantity': quantity,
      },
      getHeadersToken(),
      false,
    );

    result.fold(
          (left) {
        status = left;
        cartItemsOrder.removeWhere((order) => order.id.toString() == id);
        getOrders();
        update();
        Get.snackbar('Message', status.toString());
        update();
      },
          (right) {
        try {
          Get.snackbar('Message',right);
// cartItemsOrder.removeWhere((order) => order.id.toString() == id);

          update();
          Get.snackbar('Success', 'Order created successfully');
        } catch (e) {
          status = StatusRequest.failure;
          Get.snackbar('Error', "Error processing order response: $e");
        }
        update();
        cartItemsOrder.removeWhere((order) => order.id.toString() == id);
       getOrders();
      },
    );
  }

  void deleteOrders(String id) async {
    status = StatusRequest.loading;
    update();
    Either<StatusRequest, String> result = await Crud().postData(
      '${AppLink.order}/${id}',
      {
        '_method':'DELETE'
      },
      getHeadersToken(),
      false,
    );
    result.fold((left) {
      status = left;
      Get.snackbar('Message', status.toString());
      getOrders();
      update();
    }, (right) {
      try {
        Get.snackbar('Message', right);
      } catch (e) {
        status = StatusRequest.failure;
        Get.snackbar('Error', "Error parsing order data: $e");
      }
      getOrders();
      update();

    });
  }

}