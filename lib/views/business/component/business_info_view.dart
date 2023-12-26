import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoyse_test/constants/asset.dart';
import 'package:invoyse_test/providers/business_profile_providers.dart';
import 'package:invoyse_test/utils/app_text.dart';
import 'package:invoyse_test/widgets/app_text_field.dart';
import 'package:provider/provider.dart';

class AddBusinessInfo extends StatelessWidget {
  const AddBusinessInfo({super.key});

  @override
  Widget build(BuildContext context) {
    BusinessProfileProvider provider =
        Provider.of<BusinessProfileProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Form(
        key: provider.formKey,
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
              controller: provider.businessName,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Business name cannot be empty";
                } else if (value.length < 3) {
                  return "Business name is too short";
                } else {
                  return null;
                }
                
              },
              onChanged: (value)=> provider.checkFirstPage(),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              hintText: "Business email address",
              controller: provider.email,
               onChanged: (value)=> provider.checkFirstPage(),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              hintText: "Business Phone number",
              controller: provider.phoneNumber,
              keyboardType: TextInputType.number,
               onChanged: (value)=> provider.checkFirstPage(),
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              hintText: "Business address ",
              controller: provider.businessaddress,
               onChanged: (value)=> provider.checkFirstPage(),
               validator: (value) {
                if (value!.isEmpty) {
                  return "Business address cannot be empty";
                } else if (value.length < 3) {
                  return "Business address is too short";
                } else {
                  return null;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
