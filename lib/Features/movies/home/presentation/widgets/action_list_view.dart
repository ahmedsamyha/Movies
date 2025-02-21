import 'package:flutter/material.dart';
import 'package:movies/core/utility/constants/images.dart';

import 'action_item.dart';

class ActionListView extends StatelessWidget {
  const ActionListView({super.key,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    List<String> actionList = [
      KImages.movie1971,
      KImages.movieCaptain,
      KImages.movieBaby,
      KImages.movie1971,
      KImages.movieCaptain,
      KImages.movieBaby,
    ];
    return SizedBox(
      height: height * .28,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 16,
            );
          },
          itemCount: actionList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ActionItem(image: actionList[index],);
          },
        ),
      ),
    );
  }
}