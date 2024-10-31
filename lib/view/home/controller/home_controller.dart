import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:get/get.dart';
import 'package:products_api/core/classes/crud.dart';
import 'package:products_api/core/classes/status_request.dart';
import 'package:products_api/core/constances/const_data.dart';
import 'package:products_api/core/service/app_link.dart';
import 'package:products_api/model/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:products_api/model/products_model.dart';
import 'package:products_api/model/sub_category_model.dart';

class HomeController extends GetxController {
  var category = <Datum>[].obs;
  var products = <Details>[].obs;
  var subCategory = <subCategoryDetail>[].obs;


  var status = StatusRequest.loading;

  @override
  void onInit() {
    getCategory();
    getSubCategory();
    getProducts();
    super.onInit();
  }

  void getCategory() async {
    print(ConstData.token);
    status = StatusRequest.loading;
    update();
    Either<StatusRequest, Map> result = await Crud().getData(
      AppLink.all_category,
     getHeadersToken(),
      false,
    );
    result.fold((left) {
      status = left;
      Get.snackbar('Error', status.toString());
      update();
    }, (right) {
      try {
        var categoryList = right['data'];

        if (categoryList is List) {
          print(categoryList);
          category.value = categoryList.map((json) => Datum.fromJson(json)).toList();

          status = StatusRequest.success;
        } else {
          status = StatusRequest.failure;
          Get.snackbar('Error', "Data is not a list.");
        }
      } catch (e) {
        status = StatusRequest.failure;
        Get.snackbar('Error', "Error parsing category data: $e");
      }
      update();
    });
  }
  void getSubCategory() async {

    status = StatusRequest.loading;
    update();
    Either<StatusRequest, Map> result = await Crud().getData(
      AppLink.sub_categories,
      getHeadersToken(),
      false,
    );
    result.fold((left) {
      status = left;
      Get.snackbar('Error', status.toString());
      update();
    }, (right) {
      try {
        var subcategoryList = right['data'];

        if (subcategoryList is List) {
          print(subcategoryList);
          subCategory.value = subcategoryList.map((json) => subCategoryDetail.fromJson(json)).toSet().toList();
          status = StatusRequest.success;
        } else {
          status = StatusRequest.failure;
          Get.snackbar('Error', "Data is not a list.");
        }
      } catch (e) {
        status = StatusRequest.failure;
        Get.snackbar('Error', "Error parsing category data: $e");
      }
      update();
    });
  }



  void getProducts() async {
    status = StatusRequest.loading;
    update();
    Either<StatusRequest, Map> result = await Crud().getData(
      AppLink.all_product,
      getHeadersToken(),
      false,
    );
    print('2222222');
    result.fold((left) {
      print("Error: $left"); // Log the error message
      status = left;
      Get.snackbar('Error', status.toString());
      update();
    }, (right) {
      print("API call succeeded, result: $right"); // Log the response
      try {
        var productsList = right['data'];
        print(productsList);
        if (productsList is List) {

          products.value = productsList
              .map((json) => Details.fromJson(json))
              .toList();
          print('Product list parsed successfully:');
          print(products[1].name);
          status = StatusRequest.success;
        } else {
          print('Data is not a list'); // Log when data is not a list
          status = StatusRequest.failure;
          Get.snackbar('Error', "Data is not a list.");
        }
      } catch (e) {
        print("Error parsing product data: $e"); // Log parsing error
        status = StatusRequest.failure;
        Get.snackbar('Error', "Error parsing product data: $e");
      }
      update();
    });

  }
}
