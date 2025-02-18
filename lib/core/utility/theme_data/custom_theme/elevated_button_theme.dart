import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class CustomElevatedButtonTheme{
  CustomElevatedButtonTheme._();

  //Dark Elevated Button Theme -----------------------------

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.iconColor,
      backgroundColor: AppColors.kPrimaryColor,
     /* disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,*/
     // side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: KStyles.roboto16w400Black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))

    ),
  );
}