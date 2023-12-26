import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';

class ProfileLogo extends StatelessWidget {
  const ProfileLogo({
    super.key,
    this.image,
    this.color,
    this.title,
    this.textColor,
  });
  final DecorationImage? image;
  final Color? color;
  final Color? textColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.h,
      width: 53.w,
      decoration: BoxDecoration(
          color: color ?? AppColors.primary.shade500,
          shape: BoxShape.circle,
          image: image),
      child: Center(
          child: title != null
              ? AppText.heading4(
                  title!,
                  color: textColor ?? AppColors.white,
                )
              : const SizedBox()),
    );
  }
}
