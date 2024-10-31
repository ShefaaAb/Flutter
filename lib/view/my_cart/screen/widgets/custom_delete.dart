import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';

class CustomDelete extends StatelessWidget {
  final product;

  const CustomDelete({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCartController>(
      init: MyCartController(),
      builder: (controller) {
        return Container(
          height: MediaQueryUtil.screenHeight,
          width: MediaQueryUtil.screenWidth,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.redcolor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(icon:  SvgPicture.asset(
            AppImage.deleteIcon,
            height: MediaQueryUtil.screenWidth * 0.06,
          ),
            onPressed: (){
        controller.removeFromCart(product);
          },)
        );
      }
    );
  }
}
