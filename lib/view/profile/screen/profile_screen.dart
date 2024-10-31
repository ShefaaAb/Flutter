import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/widgets/botton_nav_bar.dart';
import 'package:products_api/view/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColors.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            Get.to(BottonNavBar());          },
        ),
        title: Text(
          'Profile',
          style: fontMdBold_RaleWay.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(AppImage.AvatarImage),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: SvgPicture.asset(
                      AppImage.editpenIcon,
                        height: MediaQueryUtil.screenWidth * 0.03,// Set height dynamically
                    ),),
                ],
              ),
              const SizedBox(height: 30),

              // Your Name TextFormField (with box)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                      'Your Name',
                      style:fontMd_RaleWay
                  ),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Programmer X',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.white_background_color,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // التحكم في المسافات الداخلية
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Email Address',
                    style: fontMd_RaleWay,
                  ),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'programmerx@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)), // تعيين الحواف الدائرية
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.white_background_color, // لون الخلفية
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // التحكم في المسافات الداخلية
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Password',
                    style: fontMd_RaleWay,
                  ),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '********',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)), // تعيين الحواف الدائرية
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.white_background_color, // لون الخلفية
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // التحكم في المسافات الداخلية
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          'Recovery Password',
                          style: fontMd_RaleWay.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CustomButton(text: 'save Now', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
