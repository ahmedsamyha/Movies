import 'package:flutter/material.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

import '../../constants/colors.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();

  //Dark TextFormField Theme -----------------------------

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    fillColor: AppColors.grayBackground,
    errorMaxLines: 3,
    prefixIconColor: AppColors.iconColor,
    suffixIconColor: AppColors.iconColor,
    labelStyle: KStyles.roboto16w400White,
    hintStyle: KStyles.roboto16w400White,
    errorStyle: KStyles.roboto16w400White,
    floatingLabelStyle: KStyles.roboto16w400White,
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: AppColors.grayBackground),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: AppColors.grayBackground),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: AppColors.kPrimaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );
}
