import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/poppins_font.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/model/products_model.dart';
import 'package:products_api/view/details/screen/details_screen.dart';
import 'package:products_api/view/favourite/controller/favourite_controller.dart';
import 'package:products_api/view/favourite/screen/widgets/favourite_icon.dart';
import 'package:products_api/view/home/widgets/leaf_clipper.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final Details product;
  final MyCartController cartController = Get.put(MyCartController());
  final FavouriteController favouriteController = Get.put(FavouriteController());

  ProductCard({super.key, required this.imageUrl, required this.product});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);

    return InkWell(
      onTap: () {

        Get.to(() => DetailsScreen(), arguments: product);
      },
      child: Stack(
        children: [
          Card(
            color: AppColors.whitecolor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MediaQueryUtil.defaultRadius*2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8), // Padding around the image
                    color: AppColors.whitecolor,
                    child: Image.asset(
                      imageUrl,
                      height: MediaQueryUtil.screenHeight * 0.15,
                    ),
                  ),
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.01),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    'Best Seller',
                    style: fontMd_Poppins.copyWith(
                        color: AppColors.btn_Green_color),
                  ),
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.005),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    product.name,
                    style: fontMd_RaleWay.copyWith(color: AppColors.gray_text_color),
                  ),
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.005),
                Flexible(
                  fit: FlexFit.loose,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          '\$${product.price.toString()}',
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth * 0.035,
                              color: Colors.green),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            cartController.addToCart(product);
                            Get.snackbar(
                              'Product Added',
                              '${product.name} has been added to the cart',
                              backgroundColor: Colors.grey,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: Duration(seconds: 1),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipPath(
                                clipper: LeafClipper(),
                                child: Container(
                                  width: MediaQueryUtil.screenWidth * 0.1,
                                  height: MediaQueryUtil.screenHeight * 0.05,
                                  color: Colors.green,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: MediaQueryUtil.screenWidth * 0.05,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Favorite Icon Button
         FavouriteIcon(favorititem: product),
        ],
      ),
    );
  }
}
