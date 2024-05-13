import 'package:blog_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border({Color color = AppColors.borderColor}) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3.0),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          focusedBorder: _border(
            color: AppColors.gradient2,
          ),
          enabledBorder: _border()));
}
