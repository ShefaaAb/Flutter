import 'package:flutter/material.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/poppins_font.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/model/products_model.dart';

class CustomProductCard extends StatelessWidget {
  final Details product;

  const CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppColors.whitecolor,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        horizontalTitleGap: MediaQueryUtil.screenWidth * 0.1,
        leading: Container(
          width: MediaQueryUtil.screenWidth * 0.20,
          height: MediaQueryUtil.screenWidth * 0.20,
          decoration: BoxDecoration(
            color: AppColors.white_background_color,

          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              AppImage.tshirt_debugging,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          product.name,
          style: fontMd_RaleWay,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '\$${product.price.toString()}',
          style: fontMd_Poppins,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
