import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/classes/status_request.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/home/controller/home_controller.dart';
import 'package:products_api/view/home/widgets/product_card.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';

class ShowAllProduct extends StatelessWidget {
  const ShowAllProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Product' ,style: fontMdBold_RaleWay,),
        centerTitle: true,
      ),
      body:  GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQueryUtil.screenHeight ,
                child: controller.status == StatusRequest.loading
                    ? Center(child: CircularProgressIndicator()) // Show loading indicator
                    : controller.status == StatusRequest.failure
                    ? Center(child: Text("Failed to load products"))
                    : GridView.builder(
                  itemCount: controller.products.length,
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
              ),);
          }
      ),
    );

  }
}
