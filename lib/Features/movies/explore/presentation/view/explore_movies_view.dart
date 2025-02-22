import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/explore/data/data_source/explore_cubit/explore_cubit.dart';
import 'package:movies/Features/movies/explore/data/data_source/explore_cubit/explore_state.dart';
import 'package:movies/Features/movies/explore/presentation/widgets/explore_grid_view.dart';
import 'package:movies/core/utility/constants/colors.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class ExploreMoviesView extends StatefulWidget {
  ExploreMoviesView({super.key});

  @override
  State<ExploreMoviesView> createState() => _ExploreMoviesViewState();
}

class _ExploreMoviesViewState extends State<ExploreMoviesView> {
  List<String> type = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Drama",
    "Family",
    "Fantasy",
    "Horror",
    "Mystery",
    "Romance",
    "Sport",
    "Western",
  ];

  int selectedIndex = 0;
  final searching = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          ExploreCubit(GetExploreInitialState(), ApiService(dio: Dio()))
            ..getExploreMovies(genre: type[selectedIndex].toLowerCase()),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 48,
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 16,
                        );
                      },
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: type.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                            BlocProvider.of<ExploreCubit>(context)
                                .getExploreMovies(genre: type[index]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: selectedIndex == index
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppColors.kPrimaryColor,
                                  )
                                : BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.kPrimaryColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppColors.darkBackground,
                                  ),
                            child: Text(
                              type[index],
                              style: selectedIndex == index
                                  ? KStyles.roboto20w700Black
                                  : KStyles.roboto20w700Primary,
                            ),
                          ),
                        );
                      })),
              SizedBox(
                height: 16,
              ),
              ExploreGridView()
            ],
          ),
        ),
      ),
    );
  }
}
