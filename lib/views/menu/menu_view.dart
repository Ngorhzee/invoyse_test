import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_test/constants/asset.dart';
import 'package:invoyse_test/utils/app_text.dart';
import 'package:invoyse_test/utils/colors.dart';
import 'package:invoyse_test/views/menu/components/menu_cards.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    SizedBox()
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
                        Container(
                          height: 53.h,
                          width: 53.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: AppText.heading4(
                              "JS",
                              color: AppColors.primary.shade500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 28.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.heading4("James & Sons"),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
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
                  MenuCards(
                      title: "Business details",
                      subtitle: "Logo, Name, Contact information..."),
                  MenuCards(
                      title: "Quotations",
                      subtitle: "Quotation list, create quotations..."),
                  MenuCards(
                      title: "Manage staff", subtitle: "Invoice templates"),
                  MenuCards(
                      title: "Invoice templates",
                      subtitle: "Select templates, change colors..."),
                  MenuCards(
                      title: "Payment information",
                      subtitle: "Payment options, instructions..."),
                  MenuCards(title: "Tax", subtitle: "Tax options"),
                  MenuCards(
                      title: "Default notes",
                      subtitle: "Invoice notes, Estimate notes"),
                  MenuCards(
                      title: "Customization options",
                      subtitle:
                          "Invoice no., Quantity label, Invoice title..."),
                  MenuCards(title: "Export "),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 19.w, vertical: 20.h),
                    color: AppColors.grey.shade100.withOpacity(.19),
                    child: AppText.heading3("Account settings"),
                  ),
                  MenuCards(
                    title: "Upgrade  your plan",
                    showArrow: false,
                  ),
                  MenuCards(
                    title: "Country/region settings",
                    subtitle: "Currency, country, language...",
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 14.h, 20.w, 16.h),
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
