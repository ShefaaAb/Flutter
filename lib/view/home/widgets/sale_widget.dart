import 'package:flutter/material.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/service/media_query.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQueryUtil.screenWidth*0.9,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whitecolor,
            borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.whitecolor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding: EdgeInsets.all(16),
              child: Container(
                height: MediaQueryUtil.screenHeight * 0.08,
                width: MediaQueryUtil.screenWidth*0.9,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppImage.sale,
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              right: 16,
              child: Row(
                children: [
                  Image.asset(
                    AppImage.new1,
                  ),
                  Image.asset(
                    AppImage.tshirt3,
                    height: 115,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
