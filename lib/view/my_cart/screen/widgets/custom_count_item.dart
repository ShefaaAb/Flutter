import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/model/products_model.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';

class CustomCountItem extends StatelessWidget {
  final int productQ;
  final product;

  const CustomCountItem({super.key, required this.productQ, this.product});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
      init: MyCartController(),
      builder: (controller) {
        return Container(
          height: MediaQueryUtil.screenHeight * 0.2,
          width: MediaQueryUtil.screenWidth * 0.2,
          decoration: BoxDecoration(
            color: AppColors.btn_Green_color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.add,color: AppColors.whitecolor,),
                onPressed: () {
                  controller.addToCart(product);
                },
              ),
              Text(
                productQ.toString(),
                style: fontMd_RaleWay.copyWith(color: Colors.white),
              ),
              IconButton(

                icon: const Icon(Icons.remove,color: AppColors.whitecolor,),
                onPressed: () {
                  controller.removeFromCart(product);
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
