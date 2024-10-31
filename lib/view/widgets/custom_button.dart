import 'package:flutter/material.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/raleway_font.dart';
import 'package:products_api/core/service/media_query.dart'; // تعديل المسار حسب موقع AppColors

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
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
          backgroundColor: AppColors.btn_Green_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:fontMdBold_RaleWay.copyWith(color: AppColors.whitecolor),
        ),
      ),
    );
  }
}
