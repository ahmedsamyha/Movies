import 'package:flutter/material.dart';
import 'package:movies/view/movies/explore/widgets/explore_custom_item_movie.dart';

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
            return ExploreCustomItemMovie(photo:list[index] ,);
          },
        ),
      ),
    );
  }
}
