import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/poppins_font.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/orders/controller/orders_controller.dart';
import 'package:products_api/view/orders/screen/widgets/update_delete_order.dart';

class PastOrderCard extends StatelessWidget {
  const PastOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OrdersController>(
        init: OrdersController(),
        builder: (controller) {
          if (controller.orders.isEmpty) {
            return Center(child: Text('No past orders'));
          }
          return ListView.builder(
            itemCount: controller.orders.toSet().toList().length,
            itemBuilder: (context, index)
            {
              final orderid = controller.orders[index].id;

              final order = controller.orders[index].peoduct;

              return Card(
                elevation: 10,
                color: AppColors.whitecolor,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  horizontalTitleGap: MediaQueryUtil.screenWidth * 0.1,
                  leading: Container(
                    width: MediaQueryUtil.screenWidth * 0.20,
                    height: MediaQueryUtil.screenWidth * 0.20,
                    decoration: BoxDecoration(
                      color: AppColors.white_background_color,

                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                       AppImage.tshirt_debugging,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  title: Text(
                    order.name,
                    style: fontMd_RaleWay,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        'price: \$${order.price}',
                        style: fontMd_Poppins.copyWith(fontSize: 14),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'quantity: ${controller.orders[index].quantity}',
                        style: fontMd_Poppins.copyWith(fontSize: 14),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      IconButton(onPressed: (){
                        showUpdateDialog(context, controller, orderid,controller.orders[index].quantity.toString());
                      }, icon: Icon(Icons.update)),


                      IconButton(
                        onPressed: () {
                          print('prder id');
                          print(order.id);
                        showDeleteDialog(context, controller, orderid,order);
                        },
                        icon: Icon(Icons.delete),
                      ),

                    ],
                  ),
                ),
              )  ; },
          );
        }
    );
  }
}
