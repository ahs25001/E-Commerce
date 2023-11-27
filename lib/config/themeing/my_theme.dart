import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData light=ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.blue
      )
    )
  );
}