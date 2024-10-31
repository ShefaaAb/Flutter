import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/auth/controller/auth_controller.dart';
import 'package:products_api/view/favourite/screen/favourite_screen.dart';
import 'package:products_api/view/my_cart/screen/my_cart_screen.dart';
import 'package:products_api/view/notifications/screen/notifications_screen.dart';
import 'package:products_api/view/orders/screen/orders_screen.dart';
import 'package:products_api/view/profile/screen/profile_screen.dart';
import 'package:products_api/view/side_menu/screen/widgets/custom_list_tile.dart';
class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    final AuthController authController = Get.put(AuthController());
    return Drawer(
      backgroundColor: AppColors.black_text_color,
      child: Padding(
        padding: EdgeInsets.all(MediaQueryUtil.screenWidth * 0.04), // Use MediaQueryUtil
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: MediaQueryUtil.screenHeight * 0.03),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQueryUtil.screenWidth * 0.1,
                  backgroundImage: AssetImage(AppImage.AvatarImage),
                ),
              ],
            ),
            SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
            Text(
              "Programmer X",
              style: fontMd_RaleWay.copyWith(
                color: AppColors.whitecolor,
                fontSize: MediaQueryUtil.screenWidth * 0.05,
              ),
            ),
            SizedBox(height: MediaQueryUtil.screenHeight * 0.03),
            CustomListTile(
              iconPath: AppImage.profileIcon,
              title: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            CustomListTile(
              iconPath: AppImage.bagIcon,
              title: 'My Cart',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyCartScreen(),
                  ),
                );
              },
            ),
            CustomListTile(
              iconPath: AppImage.favoriteIcon,
              title: 'Favorite',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavouriteScreen(),
                  ),
                );
              },
            ),
            CustomListTile(
              iconPath: AppImage.orderIcon,
              title: 'Orders',
              onTap: () {
                Get.to(OrdersScreen());
              },
            ),
            CustomListTile(
              iconPath: AppImage.notificationIcon,
              title: 'Notifications',
              onTap: () {
                Get.to(NotificationsScreen());
              },
            ),
            CustomListTile(
              iconPath: AppImage.settingIcon,
              title: 'Settings',
              onTap: () {},
            ),
            Divider(color: AppColors.whitecolor, thickness: 1),
            TextButton(
              onPressed: () {
                authController.logout();
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImage.logoutIcon,
                    color: AppColors.whitecolor,
                  ),
                  SizedBox(width: MediaQueryUtil.screenWidth * 0.04),
                  Text(
                    'Sign Out',
                    style: fontMd_RaleWay.copyWith(
                      color: AppColors.whitecolor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
