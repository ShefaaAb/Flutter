import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/favourite/screen/favourite_screen.dart';
import 'package:products_api/view/home/screen/home_screen.dart';
import 'package:products_api/view/my_cart/screen/my_cart_screen.dart';
import 'package:products_api/view/notifications/screen/notifications_screen.dart';
import 'package:products_api/view/profile/screen/profile_screen.dart'; // Import the screen

class BottonNavBar extends StatefulWidget {
  const BottonNavBar({super.key});

  @override
  State<BottonNavBar> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int index = 0;

  final screens = [
     HomeScreen(),
    const FavouriteScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          CurvedNavigationBar(
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            color: Colors.white,
            buttonBackgroundColor: Colors.transparent,
            height: 60,

            items: <Widget>[
              Icon(Icons.home_outlined, color: index == 0 ? AppColors.btn_Green_color : Colors.grey),
              SvgPicture.asset(AppImage.favoriteIcon, color: index == 1 ? AppColors.btn_Green_color : Colors.grey) ,
              SizedBox.shrink(),
             SvgPicture.asset(AppImage.notificationIcon,color: index == 2 ? AppColors.btn_Green_color : Colors.grey) ,
              SvgPicture.asset(AppImage.profileIcon,color: index == 3 ? AppColors.btn_Green_color : Colors.grey) ,
            ],
            index: index > 1 ? index - 1 : index,
            onTap: (selectedIndex) {
              setState(() {
                if (selectedIndex == 2) return;
                if (selectedIndex > 2) {
                  index = selectedIndex - 1;    } else {
                  index = selectedIndex;  }
              });
            },
          ),

          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: AppColors.btn_Green_color,
              elevation: 5,
              onPressed: () {
                Get.to(MyCartScreen());
              },
              child: SvgPicture.asset(
                'assets/icons/bag_icon.svg',
                color: AppColors.whitecolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
