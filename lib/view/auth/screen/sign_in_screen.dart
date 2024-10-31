import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';
import 'package:products_api/view/auth/controller/auth_controller.dart';
import 'package:products_api/view/auth/screen/register_account_screen.dart';
import 'package:products_api/view/widgets/custom_button.dart';
import 'package:products_api/view/widgets/custom_google_button.dart';

class SignInScreen extends StatelessWidget {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    final AuthController controller = Get.put(AuthController(
    )
    );

    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColors.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss keyboard
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQueryUtil.screenWidth * 0.06,
            vertical: MediaQueryUtil.screenHeight * 0.01,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                Text(
                  'Hello Again!',
                  style: fontXlBold_RaleWay.copyWith(
                    color: Colors.black,
                    fontSize: MediaQueryUtil.screenWidth * 0.07,
                  ),
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.01),
                Center(
                  child: Text(
                    'Fill Your Details Or Continue With\nSocial Media',
                    textAlign: TextAlign.center,
                    style: fontMd_RaleWay.copyWith(
                      color: AppColors.gray_text_color,
                      fontSize: MediaQueryUtil.screenWidth * 0.04,
                    ),
                  ),
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email Address', style: fontMd_RaleWay),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.005),
                    TextField(
                      focusNode: emailFocusNode,
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        hintText: 'programmerx@gmail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(MediaQueryUtil.defaultRadius),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.white_background_color,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQueryUtil.screenWidth * 0.04,
                          vertical: MediaQueryUtil.screenHeight * 0.015,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.02),
                    Text('Password', style: fontMd_RaleWay),
                    SizedBox(height: MediaQueryUtil.screenHeight * 0.005),
                    Obx(() => TextFormField(
                      focusNode: passwordFocusNode,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                          },
                        ),
                        hintText: '********',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(MediaQueryUtil.defaultRadius),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.white_background_color,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQueryUtil.screenWidth * 0.04,
                          vertical: MediaQueryUtil.screenHeight * 0.015,
                        ),
                      ),
                      obscureText: controller.isPasswordHidden.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    )),
                  ],
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.04),
                CustomButton(
                  text: 'Sign in',
                  onPressed: () {
                      controller.login();

                  },
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.03),
                CustomGoogleButton(
                  text: 'Sign up with Google',
                  onPressed: () {},
                ),
                SizedBox(height: MediaQueryUtil.screenHeight * 0.1),
                TextButton(
                  onPressed: () {
                    Get.to(RegisterAccountScreen());
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'New User? ',
                      style: fontMd_RaleWay.copyWith(
                          color: AppColors.gray_text_color),
                      children: [
                        TextSpan(
                          text: 'Create Account',
                          style: fontMdBold_RaleWay,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
