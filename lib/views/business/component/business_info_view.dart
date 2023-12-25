import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoyse_test/constants/asset.dart';
import 'package:invoyse_test/utils/app_text.dart';
import 'package:invoyse_test/widgets/app_text_field.dart';

class AddBusinessInfo extends StatelessWidget {
  const AddBusinessInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          SvgPicture.asset(AppAssets.receipt),
          SizedBox(
            height: 16.h,
          ),
          AppText.heading2("Business Information."),
          SizedBox(
            height: 10.h,
          ),
          AppText.body1("Create your business profile."),
          SizedBox(
            height: 7.h,
          ),
          AppText.smallText1("(All fields are optional.)"),
          SizedBox(
            height: 28.h,
          ),
          AppTextField(
            hintText: "Business name",
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hintText: "Business email address",
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hintText: "Business Phone number",
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextField(
            hintText: "Business address ",
          )
        ],
      ),
    );
  }
}
