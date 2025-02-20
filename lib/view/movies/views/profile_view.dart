import 'package:flutter/material.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Image.asset('assets/images/avatar2.png'),
          ],
        )],
    );
  }
}
