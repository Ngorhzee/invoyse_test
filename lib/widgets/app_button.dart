import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/utils/app_text.dart';
import 'package:invoyse_test/utils/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.enabled = true,
    this.size,
    this.foregroundColor,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.radius,
    this.fontSize,
    this.fontWeight,
    this.icon,
    this.border,
    this.textColor,
    this.textStyle,
  }) : isText = false;

  AppButton.expanded({
    required this.text,
    required this.onPressed,
    double? height,
    super.key,
    this.enabled = true,
    this.foregroundColor,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.fontSize,
    this.radius,
    this.fontWeight,
    this.icon,
    this.border,
    this.textColor,
    this.textStyle,
  })  : size = Size(207.w, height ?? 35.h),
        isText = false;

  const AppButton.text({
    required this.text,
    required this.onPressed,
    super.key,
    this.enabled = true,
    this.size,
    this.foregroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.fontSize,
    this.fontWeight,
    this.radius,
    this.icon,
    this.border,
    this.textColor,
    this.textStyle,
  })  : isText = true,
        backgroundColor = null;

  final bool enabled;
  final bool isText;
  final Size? size;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon;
  final String text;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? radius;
  final double? fontSize;
  final BorderSide? border;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return isText
        ? TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                return foregroundColor?.withOpacity(.05);
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (!enabled) {
                  return AppColors.primary.withOpacity(.5);
                }
                return foregroundColor;
              }),
            ),
            onPressed: () {
              if (enabled) {
                onPressed?.call();
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  icon!,
                  SizedBox(width: 10.w),
                ],
              AppText.buttonText(text)
              ],
            ))
        : ElevatedButton(
            style: ButtonStyle(
              side: border == null ? MaterialStateProperty.all(BorderSide(color: AppColors.primary,width: 1.h)) : MaterialStateProperty.all(border),
              minimumSize: size != null
                  ? MaterialStateProperty.all(size)
                  : MaterialStateProperty.all(Size(0, 44.h)),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (!enabled) {
                  return foregroundColor?.withOpacity(0.4) ??
                      AppColors.primary.withOpacity(.17);
                }
                return foregroundColor ?? AppColors.primary;
              }),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (!enabled) {
                  return Colors.transparent;
                }
                return foregroundColor?.withOpacity(.1);
              }),
              shadowColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                return Colors.transparent;
              }),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (!enabled) {
                    return backgroundColor != null
                        ? backgroundColor?.withOpacity(.5)
                        : AppColors.primary.withOpacity(.5);
                  }
                  return backgroundColor ?? AppColors.primary;
                },
              ),
              
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 20.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 0,
                  vertical: verticalPadding ?? 0,
                ),
              ),
            ),
            onPressed: () {
              if (enabled) {
                onPressed?.call();
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.buttonText(
                   text,
                
                ),
                if (icon != null) ...[
                  SizedBox(width: 10.w),
                  icon!,
                ],
              ],
            ),
          );
  }
}
