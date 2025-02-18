import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';


class CustomOutlineButtonTheme{
  CustomOutlineButtonTheme._();
  //Dark OutlineButton Theme -----------------------------

  static OutlinedButtonThemeData darkOutlineButtonTheme = OutlinedButtonThemeData(

    style:  OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.kPrimaryColor,
      side: const BorderSide(color: AppColors.kPrimaryColor,width: 2),
      textStyle: KStyles.inter20w600primary,
      padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
    ),
  );
}