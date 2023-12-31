import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_test/constants/asset.dart';
import 'package:invoyse_test/views/business/component/business_info_view.dart';
import 'package:provider/provider.dart';

import '../../providers/business_profile_providers.dart';
import '../../services/page_router.dart';
import '../../widgets/app_button.dart';
import 'component/business_branding_view.dart';
import 'component/business_stoke_widget.dart';

class AddBusinessView extends StatefulWidget {
  const AddBusinessView({super.key});

  @override
  State<AddBusinessView> createState() => _AddBusinessViewState();
}

class _AddBusinessViewState extends State<AddBusinessView> {
  int index = 0;
  PageRouter pageRouter = PageRouter.instance;
  @override
  Widget build(BuildContext context) {
    BusinessProfileProvider provider =
        Provider.of<BusinessProfileProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 27.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        pageRouter.goBack();
                      } else {
                        index = index - 1;
                        setState(() {});
                      }
                    },
                    child: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: SvgPicture.asset(AppAssets.arrowBack)),
                  ),
                  Row(
                    children: [
                      BusinessStrokeWidget(isActive: index == 0),
                      SizedBox(
                        width: 6.w,
                      ),
                      BusinessStrokeWidget(isActive: index == 1),
                    ],
                  ),
                  SizedBox()
                ],
              ),
              SizedBox(
                height: 17.h,
              ),
              Expanded(
                  child: ListView(
                children: [
                  SizedBox(
                    height: 17.h,
                  ),
                  index == 0 ? AddBusinessInfo() : AddBusinessBranding(),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              )),
              SizedBox(
                height: 15.h,
              ),
              AppButton.expanded(
                text: index == 0 ? "Next" : "Create Your Invoice",
                enabled: index == 0 ? provider.buttonEnabled : true,
                onPressed: () {
                  if (index < 1) {
                    if (provider.formKey.currentState!.validate()) {
                      index = index + 1;
                      setState(() {});
                    }
                  } else {
                    provider.addBusinessProfile();
                    pageRouter.goBack();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


