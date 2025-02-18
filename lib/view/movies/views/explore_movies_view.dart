import 'package:flutter/material.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class ExploreMoviesView extends StatelessWidget {
  const ExploreMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Center(child: Text('Explore Movies View' , style: KStyles.roboto20w700Primary,))
      ],
    );
  }
}
