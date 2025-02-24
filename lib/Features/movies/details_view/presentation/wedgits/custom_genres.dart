import 'package:flutter/material.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class CustomGenresItem extends StatelessWidget {
  const CustomGenresItem({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Color(0xFF282A28).withValues(alpha: .8),
          borderRadius: BorderRadius.circular(16)),
      child: Text(
        text,
        style: KStyles.roboto16w400White,
        textAlign: TextAlign.center,
      ),
    );
  }
}