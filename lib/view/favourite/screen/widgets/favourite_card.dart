import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/model/products_model.dart';
import 'package:products_api/view/favourite/controller/favourite_controller.dart';
import 'package:products_api/view/favourite/screen/widgets/favourite_icon.dart';

class FavouriteCard extends StatelessWidget {
  final Details favorititem;
  const FavouriteCard({super.key, required this.favorititem});

  @override
  Widget build(BuildContext context) {
    final FavouriteController favouriteController = Get.find<FavouriteController>();

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQueryUtil.screenWidth * 0.025,
              vertical: MediaQueryUtil.screenHeight * 0.01),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        AppImage.tshirt1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQueryUtil.screenWidth * 0.02),
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    favorititem.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: MediaQueryUtil.screenWidth * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${favorititem.price}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                          SizedBox(height: MediaQueryUtil.screenHeight * 0.01),                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.withOpacity(0.5)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                },
                child: Container(
                  height: MediaQueryUtil.screenWidth * 0.08,
                  width: MediaQueryUtil.screenWidth * 0.08,
                  decoration: BoxDecoration(
                    color: AppColors.white_background_color,
                    shape: BoxShape.circle,
                  ),
                  child:FavouriteIcon(favorititem: favorititem,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
