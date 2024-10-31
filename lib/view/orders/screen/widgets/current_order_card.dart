import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/const_data.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/orders/controller/orders_controller.dart';

class CurrentOrderCard extends StatelessWidget {
  const CurrentOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OrdersController>(
      init: OrdersController(),
      builder: (controller) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: controller.cartItemsOrder.toSet().toList().length,
                  itemBuilder: (context, index) {
                    if (controller.cartItemsOrder.isEmpty) {
                      return Center(child: Text('No items in Orders'));
                    }
                    final uniqueOrders = controller.cartItemsOrder.toSet().toList();
                    final order = uniqueOrders[index];
                    final quantity = controller.orderQuantity(order);

                    return Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  AppImage.tshirt_debugging,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQueryUtil.screenHeight * 0.01),                            Text(
                              order.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('price: \$${order.price}'),
                            SizedBox(height: MediaQueryUtil.screenHeight * 0.01),                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    controller.removeFromOrder(order);
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.gray_text_color,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    quantity.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    controller.addToOrder(order);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(onPressed: () {
                                  controller.createOrders(order.id.toString(), quantity.toString());

                                }, child: Text('Order Item',style: fontMd_RaleWay.copyWith(color: AppColors.whitecolor),),
                                  style:ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.btn_Green_color,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),),
                                IconButton(
                                    onPressed: (){
                                      controller.removeFromOrder(order);

                                    },
                                    icon: Icon(Icons.delete_outline,color: AppColors.whitecolor,),
                                    style:ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.redcolor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          
          ],
        );
      }
    );
  }
}
