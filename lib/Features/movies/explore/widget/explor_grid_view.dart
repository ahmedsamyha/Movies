import 'package:flutter/material.dart';
import 'package:movies/Features/movies/explore/widget/explor_custom_item.dart';
import 'package:movies/Features/movies/explore/widget/explor_list_item.dart';

class ExploreGridView extends StatelessWidget {
  const ExploreGridView({required this.list,super.key});

  final  list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8),
          itemCount: list.length,
          physics: BouncingScrollPhysics(),

          itemBuilder: (context,index){
            return PhotoStarsItem(photo: list[index]);
          },
        ),
      ),
    );
  }
}
