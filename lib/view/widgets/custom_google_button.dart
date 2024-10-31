import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart';

class CustomGoogleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomGoogleButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQueryUtil.screenWidth,
      height:  MediaQueryUtil.screenHeight*0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white_background_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(AppImage.googleIcon),
            ),

            Text(
              text,
              style:fontMdBold_RaleWay.copyWith(color: AppColors.black_text_color),
            ),
          ],
        ),
      ),
    );
  }
  }

