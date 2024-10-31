import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:products_api/core/classes/status_request.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/home/controller/home_controller.dart';
import 'package:products_api/view/home/widgets/category_card.dart';
import 'package:products_api/view/home/widgets/sale_widget.dart';
import 'package:products_api/view/home/widgets/show_all_product.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';
import 'package:products_api/view/my_cart/screen/my_cart_screen.dart';
import '../../side_menu/screen/side_menu_screen.dart';
import '../widgets/product_card.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
HomeController controller=Get.put(HomeController())
;
  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return Scaffold(
      backgroundColor: AppColors.white_background_color,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppImage.highlightIcon,
                ),
              ],
            ),
            Text(
              'Explore',
              style: fontXlBold_RaleWay,
            ),
          ],
        ),
        backgroundColor: AppColors.white_background_color,
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: SvgPicture.asset(
               AppImage.sideMenuIcon,
                height: 24,
              ),
              onPressed:() {
            print("Drawer button");
            Scaffold.of(context).openDrawer();},
            );
          }
        ),
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
                    height: MediaQueryUtil.screenWidth * 0.06, // Set height dynamically
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
                        :SizedBox.shrink();}
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: SideMenuScreen(),
      body: GetBuilder<HomeController>(
          init:HomeController(),
          builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SearchBarCustom(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduced padding
                child: Row(
                  children: [
                    Text('Select Category', style: fontMdBold_RaleWay),
                  ],
                ),
              ),
              SizedBox(height: MediaQueryUtil.screenHeight * 0.02),              SizedBox(
                height: MediaQueryUtil.screenHeight * 0.05,
                child: controller.status == StatusRequest.loading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.category.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQueryUtil.screenWidth * 0.01), // Reduced horizontal padding
                      child: SizedBox(
                        width: MediaQueryUtil.screenWidth * 0.3,
                        child: CategoryCard(
                          title: controller.category[index].name,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQueryUtil.screenHeight * 0.01),              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Products: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {
                        Get.to(ShowAllProduct());
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(color: AppColors.btn_Green_color),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQueryUtil.screenHeight * 0.01),              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQueryUtil.screenHeight * 0.32,
                  child: controller.status == StatusRequest.loading
                      ? Center(child: CircularProgressIndicator())
                      : controller.status == StatusRequest.failure
                      ? Center(child: Text("Failed to load products"))
                      : controller.products.isEmpty
                      ? Center(child: Text("No products available"))
                      : GridView.builder(
                    itemCount: controller.products.length < 2
                        ? controller.products.length
                        : 2, // Limit to 2 items or available length
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return ProductCard(
                        imageUrl: AppImage.tshirt2,
                        product: product,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Arrivals',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(color: AppColors.btn_Green_color),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
              SaleWidget()
            ],
          ),
        );
      }),
    );
  }
}
