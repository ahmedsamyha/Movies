import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class CustomRatingItem extends StatelessWidget {
  const CustomRatingItem({
    super.key, required this.text, required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.symmetric( vertical: 16),
      decoration: BoxDecoration(
          color: Color(0xFF282A28).withValues(alpha: .8),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 32,
            color: AppColors.kPrimaryColor,
          ),
          Text(
            text,
            style: KStyles.roboto24w700White,
          ),
        ],
      ),
    );
  }
}