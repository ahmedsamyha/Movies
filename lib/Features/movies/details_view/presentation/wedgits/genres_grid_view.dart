import 'package:flutter/material.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';

import 'custom_genres.dart';

class GenresGridView extends StatelessWidget {
   GenresGridView({super.key,required this.movieModel});
  MovieModel?movieModel;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 42,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8),
      itemCount: movieModel!.genres!.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomGenresItem(text: movieModel!.genres![index]);
      },
    );
  }
}
