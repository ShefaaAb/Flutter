import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/const_data.dart';
import 'package:products_api/core/constances/poppins_font.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/my_cart/controller/my_cart_controller.dart';
import 'package:products_api/view/my_cart/screen/widgets/custom_product_card.dart';
import 'package:products_api/view/orders/controller/orders_controller.dart';
import 'package:products_api/view/orders/screen/widgets/current_order_card.dart';
import 'package:products_api/view/orders/screen/widgets/past_order_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white_background_color,
        appBar: AppBar(
          backgroundColor:AppColors.white_background_color ,
          title: Text('My Orders', style: fontMdBold_RaleWay),
          centerTitle: true,
          bottom: TabBar(
            labelColor: AppColors.btn_Green_color,
            unselectedLabelColor: AppColors.black_text_color,
            indicatorColor: AppColors.btn_Green_color,
            tabs: [
              Tab(text: 'Current Order',),
              Tab(text: 'Past Order'),
            ],
          ),
        ),
        body: GetBuilder<OrdersController>(
          init: OrdersController(),
          builder: (controller) {
            return TabBarView(
              children: [
              CurrentOrderCard(),
              PastOrderCard() ],
            );
          },
        ),
      ),
    );
  }
}
