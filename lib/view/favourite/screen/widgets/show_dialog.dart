import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:products_api/model/products_model.dart';
import 'package:products_api/view/favourite/controller/favourite_controller.dart';

void showUpdateDialog(BuildContext context, FavouriteController controller,  Details favorititem)
 {

  Get.dialog(
    AlertDialog(
      title: Text('Favourite Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Are you sure Remove  ${favorititem.name}  From The Favourite?'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            controller.removeFromFavourite(favorititem);
            Get.back();
          },
          child: Text('Yes'),
        ),
      ],
    ),
  );
}