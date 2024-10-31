import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/model/products_model.dart';
import 'package:products_api/view/favourite/controller/favourite_controller.dart';
import 'package:products_api/view/favourite/screen/widgets/show_dialog.dart';

class FavouriteIcon extends StatelessWidget {
  final Details favorititem;

  const FavouriteIcon({super.key, required this.favorititem});

  @override
  Widget build(BuildContext context) {
     return  GetBuilder<FavouriteController>(
       builder: (controller) {
         return IconButton(
           onPressed: () {
             if (controller.favouriteProducts.contains(favorititem)) {
               showUpdateDialog(context, controller, favorititem);
               controller.addToFavourite(favorititem);
             }
             else
             controller.addToFavourite(favorititem);
           },
           icon: Icon(
             controller.isFavourite(favorititem)
                 ? Icons.favorite
                 : Icons.favorite_border,
             color: controller.isFavourite(favorititem)
                 ?AppColors.redcolor
                 : AppColors.black_border_color, ),
         );
       },
     );
  }
}
