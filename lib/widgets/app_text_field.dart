import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/constants/textstyles.dart';

import '../utils/colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      this.hintText,
      this.isPassword,
      this.enabled = true,
      this.maxLines,
      this.maxLength,
      this.validator,
      this.onChanged,
      this.keyboardType,
      this.correctMessage,
      this.controller,
      this.inputFormatters,
      this.readonly,
      this.onTap,
      this.suffix,
      this.icon});
  final String? hintText;

  final bool? isPassword;

  final bool enabled;

  final int? maxLines;

  final int? maxLength;

  final String? Function(String?)? validator;

  final Function(String v)? onChanged;

  final TextInputType? keyboardType;

  final String? correctMessage;

  final TextEditingController? controller;

  final List<TextInputFormatter>? inputFormatters;

  final Widget? suffix;
  final bool? readonly;
  final Function()? onTap;

  final String? icon;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      style: hintText.copyWith(color: AppColors.primary),
      controller: widget.controller,
      validator: (value) {
        if (widget.validator != null) return widget.validator!(value!);
        return null;
      },
      keyboardType: widget.keyboardType,
      readOnly: widget.readonly ?? false,
      onTap: widget.onTap,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        errorStyle: smallText1.copyWith(color: Colors.red.shade600),
        suffixIcon: widget.suffix,
        suffixIconConstraints: BoxConstraints(
          minHeight: 1.h,
        ),
        isDense: true,
        // prefixIconConstraints: BoxConstraints(minHeight: 199, maxHeight: 200),
        contentPadding: EdgeInsets.fromLTRB(30.w, 14.h, 20.w, 13.w),

        fillColor: Color(0xFFF5F5F5),
        filled: true,
        hintText: widget.hintText,
        hintStyle: hintText,

        // filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade500),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade500),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
