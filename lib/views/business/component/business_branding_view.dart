import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/asset.dart';
import '../../../providers/business_profile_providers.dart';
import '../../../utils/app_text.dart';
import '../../../widgets/app_text_field.dart';

class AddBusinessBranding extends StatelessWidget {
  const AddBusinessBranding({super.key});

  @override
  Widget build(BuildContext context) {
     BusinessProfileProvider provider =
        Provider.of<BusinessProfileProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          Image.asset(
            AppAssets.edit,
            height: 107.h,
            width: 107.w,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 16.h,
          ),
          AppText.heading2("Business Branding."),
          SizedBox(
            height: 10.h,
          ),
          AppText.body1("Manage your business’s branding."),
          SizedBox(
            height: 7.h,
          ),
          AppText.smallText1("(All fields are optional.)"),
          SizedBox(
            height: 28.h,
          ),
          AppTextField(
            hintText: "Upload Your Logo",
            controller: provider.businessLogo,
            suffix: Padding(
              padding: EdgeInsets.only(right: 22.w),
              child: SvgPicture.asset(AppAssets.upload),
              
            ),
            onTap: ()=>provider.addBusinessLogo(),
            readonly: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hintText: "Business Category",
            controller: provider.businessCategory,
            suffix: Padding(
              padding: EdgeInsets.only(right: 22.w),
              child: SvgPicture.asset(AppAssets.category),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hintText: " NGN - Nigerian Naira (₦)",
            controller: provider.businessValue,
            suffix: Padding(
              padding: EdgeInsets.only(right: 22.w),
              child: SvgPicture.asset(AppAssets.money),
            ),
          ),
        ],
      ),
    );
  }
}
