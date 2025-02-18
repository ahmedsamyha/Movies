import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/app_bar_theme.dart';
import 'package:movies/core/utility/theme_data/custom_theme/elevated_button_theme.dart';
import 'package:movies/core/utility/theme_data/custom_theme/outline_button_theme.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_form_field_theme.dart';


class AppTheme {
  AppTheme._();

  // ----------------dark Theme---------------

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
  );
}
