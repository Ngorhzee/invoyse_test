import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_test/views/menu/components/profile_card.dart';
import 'package:provider/provider.dart';

import '../../../constants/asset.dart';
import '../../../providers/business_profile_providers.dart';
import '../../../services/page_router.dart';
import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';
import '../../business/business_view.dart';

class AddAccountBottomSheet extends StatelessWidget {
  const AddAccountBottomSheet({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
     PageRouter pageRouter = PageRouter.instance;
    BusinessProfileProvider provider =
        Provider.of<BusinessProfileProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                AppText.heading2(
                  "Switch business",
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () =>
                      pageRouter.goBack(),
                  child: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                          AppAssets.close)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Flexible(
            //height: 1.sh / 2,
            child: SingleChildScrollView(
              child: Column(children: [
                ...List.generate(
                    provider.businessProfileList
                        .length,
                    (index) => Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  provider.setActiveProfile(
                                      provider.businessProfileList[
                                          index]);
                                  pageRouter
                                      .goBack();
                                },
                                child: ProfileCard(
                                    isActive: provider
                                            .activeProfile ==
                                        provider.businessProfileList[
                                            index],
                                    businessModel:
                                        provider.businessProfileList[
                                            index])),
                            SizedBox(
                              height: 10.h,
                            ),
                            Divider(
                              color: AppColors
                                  .grey.shade600
                                  .withOpacity(
                                      .3),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        )),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              pageRouter.goBack();
              pageRouter
                  .gotoWidget(AddBusinessView());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.w),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.add),
                  SizedBox(
                    width: 27.w,
                  ),
                  AppText.heading4(
                    "Add Account",
                    color: AppColors
                        .primary.shade500,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
