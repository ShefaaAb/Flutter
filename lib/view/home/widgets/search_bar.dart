import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_api/core/constances/app_colors.dart';
import 'package:products_api/core/constances/app_image.dart';
import 'package:products_api/core/constances/app_size.dart';
import 'package:products_api/core/service/media_query.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Looking for...',
                    hintStyle: TextStyle(
                        color: AppColors.gray_color,
                        fontSize: AppSize.fontSizeMd),
                    prefixIcon: Icon(
                      Icons.search,
                      size: AppSize.iconMd,
                      color: AppColors.gray_color,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.btn_Green_color,
              ),
              child: IconButton(
                icon: SvgPicture.asset(
                 AppImage.filterIcon,
                  height: MediaQueryUtil.screenWidth *
                      0.06, // Set height dynamically
                  color: AppColors.whitecolor,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
