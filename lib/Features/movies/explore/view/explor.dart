import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/movies/explore/widget/explor_grid_view.dart';
import 'package:movies/Features/movies/explore/widget/explor_list_item.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16 , right: 16,left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ExploreListItems(
              list: type,
            ),
            SizedBox(height: 16,),
            ExploreGridView(list: list)
          ],
        ),
      ),
    );
  }
}
