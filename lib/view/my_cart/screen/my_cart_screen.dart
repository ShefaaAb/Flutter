import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/poppins_font.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';
import 'package:products_api/view/my_cart/screen/widgets/custom_count_item.dart';
import 'package:products_api/view/my_cart/screen/widgets/custom_delete.dart';
import 'package:products_api/view/my_cart/screen/widgets/custom_product_card.dart';
import 'package:products_api/view/orders/controller/orders_controller.dart';
import 'package:products_api/view/orders/screen/orders_screen.dart';
import 'package:products_api/view/widgets/custom_button.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return GetBuilder<MyCartController>(
        init: MyCartController(),
        builder: (controller) {
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
                'My Cart',
                style: fontMdBold_RaleWay.copyWith(color: Colors.black),
              ),
              centerTitle: true,
            ),

            body: controller.cartItems.isEmpty
                ? Center(
              child: Text(
                'No items in cart',
                style: fontMd_RaleWay.copyWith(color: Colors.grey),
              ),
            )
                : ListView.builder(

              itemCount: controller.cartItems.toSet().toList().length,
              itemBuilder: (context, index) {
                final product = controller.cartItems[index];
                final quantity = controller.productQuantity(product);
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.20,
                    children: [
                      SizedBox(
                        width: MediaQueryUtil.screenWidth * 0.2,
                        child: CustomCountItem(product:product,productQ: quantity,),
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    extentRatio: 0.25,
                    children: [
                      SizedBox(
                        width: MediaQueryUtil.screenWidth * 0.2,
                        child: CustomDelete(product: product,),
                      ),
                    ],
                  ),
                  child: CustomProductCard(product: product,),
                );
              },
            ),
            bottomNavigationBar: GetBuilder<MyCartController>(
              builder: (controller) {
                final deliveryFee = controller.totalPrice > 0 ? 60.20 : 0.00;
                final totalCost = controller.totalPrice + deliveryFee;
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.whitecolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                        Row(
                          children: [
                            Text(
                              'Subtotal:',
                              style: fontMd_RaleWay.copyWith(color: AppColors.gray_text_color),
                            ),
                            Spacer(),
                            Text(
                              '\$${controller.totalPrice.toStringAsFixed(2)}',
                              style: fontMd_Poppins,
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
                        Row(
                          children: [
                            Text(
                              'Delivery:',
                              style: fontMd_RaleWay.copyWith(color: AppColors.gray_text_color),
                            ),
                            Spacer(),
                            Text(
                              '\$${deliveryFee.toStringAsFixed(2)}',
                              style: fontMd_Poppins,
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                        Dash(
                          direction: Axis.horizontal,
                          length: MediaQueryUtil.screenWidth * 0.9,
                          dashLength: 5,
                          dashGap: 2,
                          dashColor: Colors.grey,
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                        Row(
                          children: [
                            Text(
                              'Total Cost',
                              style: fontMd_RaleWay,
                            ),
                            Spacer(),
                            Text(
                              '\$${totalCost.toStringAsFixed(2)}',
                              style: fontMd_Poppins.copyWith(color: AppColors.btn_Green_color),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight * 0.04),
                        CustomButton(
                          text: 'Checkout',
                          onPressed: (){
                            final ordersController = Get.put(OrdersController());
                            ordersController.addCartItemsToOrders(controller.cartItems.toSet().toList(), controller.getCartItemsWithQuantities());
                            controller.cartItems.clear();

                            Get.to(OrdersScreen());

                          }
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

          );
        });
  }
}
