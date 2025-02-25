import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/details_view/data/data_source/details_cubit/details_cubit.dart';
import 'package:movies/Features/movies/details_view/data/data_source/details_cubit/details_state.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/custom_rating_item.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/details_screen_shots_item.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/similar_grid_view.dart';
import 'package:movies/Features/movies/profile/data/data_source/favorites_cubit/favorites_cubit.dart';
import 'package:movies/Features/movies/profile/data/data_source/favorites_cubit/favorites_states.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/constants/images.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../wedgits/genres_grid_view.dart';

class DetailsView extends StatefulWidget {
  DetailsView({super.key, required this.movieModel});
  MovieModel? movieModel;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
   bool isFavorite = AppText.isFave??false;
  void changeFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:Colors.transparent
          ),
        ),
      ),
      body: BlocProvider(
  create: (context) => FavoritesCubit(FavoritesInitialState(), ApiService(dio: Dio()))..getIsFaveMovies(movieId: widget.movieModel!.id!.toInt()),
  child: BlocBuilder<FavoritesCubit, FavoritesStates>(
  builder: (context, state) {
    if (state is GetFavoritesSuccessState) {
      isFavorite = AppText.isFave ?? false;
    }
    return ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: height * .6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.movieModel!.largeCoverImage ?? ''),
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
                          onPressed: () {
                            changeFavorite();
                            BlocProvider.of<FavoritesCubit>(context).addFavorites(
                              movieId: widget.movieModel!.id.toString(),
                              name: widget.movieModel!.title ?? '',
                              rating: widget.movieModel!.rating ?? 9.5,
                              imageURL: widget.movieModel!.mediumCoverImage ?? "",
                              year: widget.movieModel!.year.toString(),
                            );
                          },
                          icon: Icon(
                            Icons.bookmark,
                            size: 29,
                            color: isFavorite?AppColors.kPrimaryColor:Colors.white,
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
                            widget.movieModel!.title ?? '',
                            style: KStyles.roboto24w700White,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${widget.movieModel!.year}',
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
                    onPressed: () async{
                      Uri uri = Uri.parse(widget.movieModel!.url!);
                      if (!await launchUrl(uri)) {
                      }else{
                        await launchUrl(uri);
                      }
                    },
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
                          text: '18', icon: Icons.favorite_outlined),
                      CustomRatingItem(
                          text: '${widget.movieModel!.runtime}',
                          icon: Icons.watch_later_rounded),
                      CustomRatingItem(
                          text: '${widget.movieModel!.rating}',
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
                        image: '${widget.movieModel!.backgroundImageOriginal}'),
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
                    ..getDetailsMovies(
                        genre: widget.movieModel!.genres![0].toLowerCase()),
                  child: SimilarGridView(),
                ),
                Text(
                  'Summary',
                  style: KStyles.roboto24w700White,
                ),
                Text(
                  maxLines: 15,
                  widget.movieModel!.summary == ""
                      ? '${widget.movieModel!.titleLong}'
                      : '${widget.movieModel!.summary}',
                  style: KStyles.roboto16w400White,
                ),
                Text(
                  'Genres',
                  style: KStyles.roboto24w700White,
                ),
                GenresGridView(
                  movieModel: widget.movieModel,
                )
              ],
            ),
          )
        ],
      );
  },
),
),
    );
  }
}
