import 'package:flutter/material.dart';

import '../constants/textstyles.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool multiText;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  /// fontSize "18"
  /// fontWeight '700'
  AppText.heading1(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = heading1.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

    /// fontSize "18"
  /// fontWeight '600'   
  AppText.heading2(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = heading2.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

    /// fontSize "20"
  /// fontWeight '700'
  AppText.heading3(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = heading3.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

    /// fontSize "19"
  /// fontWeight '700'
  AppText.heading4(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = heading4.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

    /// fontSize "14"
  /// fontWeight '400'
  AppText.body1(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = body1.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

    /// fontSize "16"
  /// fontWeight '400'
  AppText.buttonText(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = buttonText.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

  
  AppText.body2(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = body2.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

  
  AppText.body3(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = body3.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);
  AppText.body4(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = body4.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);
  AppText.smallText1(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = smallText1.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

  
  AppText.hintText(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
    this.height,
    this.letterSpacing,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textDecoration,
  })  : style = hintText.copyWith(
            color: color,
            fontSize: fontSize,
            height: height,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: textDecoration),
        super(key: key);

   @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      style: style,
    );
  }
}
