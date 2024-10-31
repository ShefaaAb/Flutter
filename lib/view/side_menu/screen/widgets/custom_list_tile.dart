

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/raleway_font.dart';

class CustomListTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        iconPath,

        color: AppColors.whitecolor,
      ),
      title: Row(
        children: [
          Text(
            title,
            style: fontMd_RaleWay.copyWith(color: AppColors.whitecolor),
          ),
          Spacer(),
          IconButton(

            icon: Icon(Icons.arrow_forward_ios, size: 16,color: AppColors.whitecolor),
            onPressed: onTap,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}