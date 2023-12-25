import 'package:flutter/material.dart';

class AppColors {
  static const primary = MaterialColor(0xFF121212, _primaryColor);
  static const grey = MaterialColor(0xFF5F5F5F, _greyColor);
  static const white = Colors.white;
}

const Map<int, Color> _primaryColor = {
  300: Color(0xFF2E2020),
  400: Color(0xFF121212),
  500: Color(0xff000000)
};
const Map<int, Color> _greyColor = {
  100: Color(0xffD9D9D930),
  200: Color(0xFF9B9B9B),
  300: Color(0xFFA5A5A5),
  400: Color(0xFF5F5F5F),
  500: Color(0xFFE6E6E6),
  600: Color(0xff606060)
};
