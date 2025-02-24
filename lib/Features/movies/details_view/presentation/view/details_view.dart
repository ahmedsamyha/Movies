import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/details_view/data/data_source/details_cubit/details_cubit.dart';
import 'package:movies/Features/movies/details_view/data/data_source/details_cubit/details_state.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/custom_rating_item.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/details_screen_shots_item.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/similar_grid_view.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

import '../wedgits/genres_grid_view.dart';

class DetailsView extends StatelessWidget {
  DetailsView({super.key, required this.movieModel});
  MovieModel? movieModel;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: height * .6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(movieModel!.largeCoverImage ?? ''),
                    fit: BoxFit.fill)),
            child: SafeArea(
              child: Stack(
                children: [
                  Image.asset(
                    KImages.detailsGradiant,
                    height: height * .67,
                    width: width,
                    fit: BoxFit.fill,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 29,
                            color: Colors.white,
                          )),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark,
                            size: 29,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(KImages.playVideo)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        spacing: 16,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            movieModel!.title ?? '',
                            style: KStyles.roboto24w700White,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${movieModel!.year}',
                            style: KStyles.roboto20w700Gray,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(
                      'Watch',
                      style: KStyles.roboto20w700White,
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRatingItem(
                          text: '15', icon: Icons.favorite_outlined),
                      CustomRatingItem(
                          text: '${movieModel!.runtime}',
                          icon: Icons.watch_later_rounded),
                      CustomRatingItem(
                          text: '${movieModel!.rating}',
                          icon: Icons.star_rounded),
                    ],
                  ),
                ),
                Text(
                  'Screen Shots',
                  style: KStyles.roboto24w700White,
                ),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => DetailsScreenShotsItem(
                        image: '${movieModel!.backgroundImageOriginal}'),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                    itemCount: 1),
                Text(
                  'Similar',
                  style: KStyles.roboto24w700White,
                ),
                BlocProvider(
                  create: (context) => DetailsCubit(
                      GetDetailsInitialState(), ApiService(dio: Dio()))
                    ..getDetailsMovies(genre:movieModel!.genres![0].toLowerCase()),
                  child: SimilarGridView(),
                ),
                Text(
                  'Summary',
                  style: KStyles.roboto24w700White,
                ),
                Text(
                  maxLines: 15,
                  movieModel!.summary == ""
                      ? '${movieModel!.titleLong}'
                      : '${movieModel!.summary}',
                  style: KStyles.roboto16w400White,
                ),
                Text(
                  'Genres',
                  style: KStyles.roboto24w700White,
                ),
                GenresGridView(
                  movieModel: movieModel,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
