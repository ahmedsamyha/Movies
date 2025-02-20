import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:movies/view/aouth/widgets/custom_text_form_field.dart';
import 'package:movies/view/movies/widgets/grid_view_item.dart';
import 'package:movies/view/movies/widgets/scroll_horizent.dart';

class ExploreMoviesView extends StatelessWidget {
  ExploreMoviesView({super.key});

  List<String> list = [
    KImages.movie1971,
    KImages.movieCaptain,
    KImages.movie1971,
    KImages.movieBaby,
  ];
  List<String> type = [
    "Action",
    "Biography",
    "Adventure",
    "Animation",
  ];
  final searching = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right:16,top: 30,left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
      height:height*0.05,
            child: ScrollHorizent(
              list: type,
            ),
          ),
          GridViewItem(list: list)
        ],
      ),
    );
  }
}
