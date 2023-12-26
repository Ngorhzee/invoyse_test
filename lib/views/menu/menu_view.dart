import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_test/constants/asset.dart';
import 'package:invoyse_test/services/page_router.dart';
import 'package:invoyse_test/utils/app_text.dart';
import 'package:invoyse_test/utils/colors.dart';
import 'package:invoyse_test/views/business/business_view.dart';
import 'package:invoyse_test/views/menu/components/menu_cards.dart';
import 'package:invoyse_test/views/menu/components/profile_card.dart';
import 'package:invoyse_test/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/business_profile_providers.dart';
import 'components/profile_logo.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    PageRouter pageRouter = PageRouter.instance;
    BusinessProfileProvider provider =
        Provider.of<BusinessProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 30.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 19.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppAssets.arrowBackIos),
                    AppText.heading1("Menu"),
                    const SizedBox()
                  ],
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
                color: AppColors.primary.shade500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ProfileLogo(
                          title: provider.activeProfile.image == null
                              ? provider.getshortForm(
                                  provider.activeProfile.businessName)
                              : null,
                          image: provider.activeProfile.image != null &&
                                  !provider.activeProfile.image!
                                      .contains("assets")
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(provider.activeProfile.image!),
                                  ),
                                )
                              : provider.activeProfile.image != null &&
                                      provider.activeProfile.image!
                                          .contains("assets")
                                  ? DecorationImage(
                                      image: AssetImage(
                                          provider.activeProfile.image!))
                                  : null,
                          color: AppColors.white,
                          textColor: AppColors.primary.shade500,
                        ),
                        SizedBox(
                          width: 28.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.heading4(
                                provider.activeProfile.businessName),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () => BottomSheets.showSheet(context,
                              
                                  child: Padding(
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
                                  )),
                              child: AppText.body4(
                                "Switch business",
                                textDecoration: TextDecoration.underline,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(AppAssets.arrowDown),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  const MenuCards(
                      title: "Business details",
                      subtitle: "Logo, Name, Contact information..."),
                  const MenuCards(
                      title: "Quotations",
                      subtitle: "Quotation list, create quotations..."),
                  const MenuCards(
                      title: "Manage staff", subtitle: "Invoice templates"),
                  const MenuCards(
                      title: "Invoice templates",
                      subtitle: "Select templates, change colors..."),
                  const MenuCards(
                      title: "Payment information",
                      subtitle: "Payment options, instructions..."),
                  const MenuCards(title: "Tax", subtitle: "Tax options"),
                  const MenuCards(
                      title: "Default notes",
                      subtitle: "Invoice notes, Estimate notes"),
                  const MenuCards(
                      title: "Customization options",
                      subtitle:
                          "Invoice no., Quantity label, Invoice title..."),
                  const MenuCards(title: "Export "),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 19.w, vertical: 20.h),
                    color: AppColors.grey.shade100.withOpacity(.19),
                    child: AppText.heading3("Account settings"),
                  ),
                  const MenuCards(
                    title: "Upgrade  your plan",
                    showArrow: false,
                  ),
                  const MenuCards(
                    title: "Country/region settings",
                    subtitle: "Currency, country, language...",
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 22.h, 20.w, 22.h),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grey.shade500,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.logout,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        AppText.body2("Logout")
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
