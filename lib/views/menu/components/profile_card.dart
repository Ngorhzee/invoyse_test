

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_test/views/menu/components/profile_logo.dart';
import 'package:provider/provider.dart';

import '../../../constants/asset.dart';
import '../../../models/busines_model.dart';
import '../../../providers/business_profile_providers.dart';
import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.isActive,
    required this.businessModel,
  });
  // final DecorationImage? image;
  // final String? title;
  //final Color? color;
  final bool isActive;
  final BusinessModel businessModel;

  @override
  Widget build(BuildContext context) {
    BusinessProfileProvider provider =
        Provider.of<BusinessProfileProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          ProfileLogo(
            title: businessModel.image == null
                ? provider.getshortForm(businessModel.businessName)
                : null,
            image: businessModel.image != null &&
                    businessModel.image!.contains("assets")
                ? DecorationImage(image: AssetImage(businessModel.image!))
                : businessModel.image != null &&
                        !businessModel.image!.contains("assets")
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(businessModel.image!)))
                    : null,
            color: businessModel.image != null
                ? AppColors.white
                : AppColors.primary,
          ),
          SizedBox(
            width: 28.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading4(
                businessModel.businessName,
                color: AppColors.primary.shade500,
              ),
              SizedBox(
                height: 6.h,
              ),
              AppText.body4(
                businessModel.businessAddress,
                color: AppColors.primary.shade500,
              )
            ],
          ),
          const Spacer(),
          isActive
              ? Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: AppColors.primary.shade300,
                      shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(AppAssets.check),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}