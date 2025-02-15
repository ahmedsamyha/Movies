import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

import '../../constants/colors.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();
  static  AppBarTheme darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBackground,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: AppColors.kPrimaryColor, size: 24),
      actionsIconTheme: IconThemeData(color: AppColors.iconColor, size: 24),
      titleTextStyle: KStyles.roboto16w400Primary);
}
