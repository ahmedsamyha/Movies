import 'package:flutter/material.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';
import 'package:movies/core/utility/constants/colors.dart';

class ExploreCustomItemMovie extends StatelessWidget {
   ExploreCustomItemMovie({required this.movieModel,super.key});
MovieModel? movieModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Image.network(movieModel!.mediumCoverImage??'https://img.yts.mx/assets/images/movies/mahogany_2022/medium-cover.jpg',
              fit: BoxFit.fill,
            )),
        Container(
          padding:
          EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          margin:
          EdgeInsets.symmetric(horizontal: 9, vertical: 11),
          decoration: BoxDecoration(
              color: Color(0xFF282A28).withValues(alpha: .8),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${movieModel!.rating}',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.star_rounded,
                color: AppColors.kPrimaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
