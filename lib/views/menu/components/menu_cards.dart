import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_test/constants/asset.dart';
import 'package:invoyse_test/utils/app_text.dart';
import 'package:invoyse_test/utils/colors.dart';

class MenuCards extends StatelessWidget {
  const MenuCards({super.key, required this.title, this.subtitle,this.showArrow=true});
  final String title;
  final String? subtitle;
  final bool showArrow;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 20.w, 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey.shade500,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.body2(title),
              SizedBox(
                height: 6.h,
              ),
              subtitle != null ? AppText.body3(subtitle!) : SizedBox(),
            ],
          ),
          showArrow? SvgPicture.asset(AppAssets.arrowForward):SizedBox(),
        ],
      ),
    );
  }
}
