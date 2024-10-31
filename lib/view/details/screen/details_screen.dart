import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/model/products_model.dart';
import 'package:products_api/view/details/controller/details_controller.dart';
import 'package:products_api/view/favourite/screen/widgets/favourite_icon.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';
import 'package:products_api/view/my_cart/screen/my_cart_screen.dart';
import 'package:products_api/view/widgets/botton_nav_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);

    final Details product = Get.arguments as Details;
    return
      Scaffold(
      backgroundColor: AppColors.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColors.white_background_color,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
           Get.to(BottonNavBar());
          },
        ),
        title: Text(
          product.name,//'T-shirt Shop',
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
                  height:
                  MediaQueryUtil.screenWidth * 0.1,
                  width:
                  MediaQueryUtil.screenWidth * 0.1,
                  decoration: BoxDecoration(
                    color: AppColors.whitecolor,
                    shape: BoxShape.circle,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    AppImage.bagIcon,
                    height: MediaQueryUtil.screenWidth * 0.06,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.to(MyCartScreen());
                  },
                ),
                GetBuilder<MyCartController>
                  (init: MyCartController(),
                    builder: (controller) {
                      return controller.cartItems.isNotEmpty
                          ?Positioned(
                        right: 2,
                        top: 2,
                        child:
                        Container(
                          height: MediaQueryUtil.screenWidth * 0.03, // Set height dynamically
                          width: MediaQueryUtil.screenWidth * 0.03, // Set width dynamically
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                        :SizedBox.shrink();;
                    }
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: fontLgBold_RaleWay.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 5),
            Text(
              product.subCategory.category.name,
              style: fontMd_RaleWay.copyWith(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: fontLgBold_RaleWay.copyWith(fontSize: 22, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(width: MediaQueryUtil.screenWidth*0.08,),
                Container(
                  height: MediaQueryUtil.screenHeight * 0.30,
                  width: MediaQueryUtil.screenWidth * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.white_background_color,
                    image: DecorationImage(
                      image: AssetImage(AppImage.tshirt_debugging),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: SvgPicture.asset(AppImage.SliderIcon),),
            const SizedBox(height: 10),
            Expanded(
              child: GetBuilder<DetailsController>(
                init: DetailsController(),
                builder: (controller) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          controller.images[index],
                          width: MediaQueryUtil.screenWidth * 0.2,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Programming and Software Engineering are your passion? Then this is made for you as a developer. Perfect surprise for any programmer, software engineer, developer, coder, computer nerd out there ......',
              style: fontMd_RaleWay.copyWith(color: Colors.grey),
            ),
            SizedBox(height: MediaQueryUtil.screenHeight * 0.01),            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                  },
                  child: Text(
                    'Read More',
                    style: fontMdBold_RaleWay.copyWith(color: AppColors.btn_Green_color),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child:FavouriteIcon(favorititem: product),
            ),
            SizedBox(width: 16),
            GetBuilder<MyCartController>(
              init: MyCartController(),
              builder: (cartController) {
                return Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.btn_Green_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    onPressed: () {
                      cartController.addToCart(product);
                      Get.snackbar(
                        "Added to Cart",
                        "${product.name} has been added to your cart!",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green[200],
                        colorText: Colors.black,
                        duration: Duration(seconds: 2),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0), // زيادة الارتفاع لجعل الزر مستطيلاً
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // جعل العناصر في الوسط
                        children: [
                          SvgPicture.asset(
                            'assets/icons/bag_icon.svg',
                            height: MediaQueryUtil.screenWidth * 0.06, // ضبط ارتفاع الأيقونة ديناميكياً
                            color: AppColors.whitecolor,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add To Cart',
                            style: fontMd_RaleWay.copyWith(color: AppColors.whitecolor), // النص باللون الأبيض
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
