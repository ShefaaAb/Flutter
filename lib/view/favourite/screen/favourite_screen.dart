import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/favourite/controller/favourite_controller.dart';
import 'package:products_api/view/favourite/screen/widgets/favourite_card.dart';
import 'package:products_api/view/home/screen/home_screen.dart';
import 'package:products_api/view/widgets/botton_nav_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouriteController favouriteController =
        Get.put(FavouriteController());

    return Scaffold(
      backgroundColor: AppColors.white_background_color,
      appBar: AppBar(
        backgroundColor: AppColors.white_background_color,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Favourite',
          style: fontMdBold_RaleWay.copyWith(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQueryUtil.screenWidth * 0.1,
                  width: MediaQueryUtil.screenWidth * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.whitecolor,
                    shape: BoxShape.circle,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: GetBuilder<FavouriteController>
        (builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: controller.favouriteProducts.isEmpty
              ? Center(
            child: Text('No Item in your Favourite'),
          )
              :GridView.builder(
              itemCount: controller.favouriteProducts.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 7 / 8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final product = controller.favouriteProducts[index];

                return FavouriteCard(favorititem: product);
              }),
        );
      }),
    );
  }
}
