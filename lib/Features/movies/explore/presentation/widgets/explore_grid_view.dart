import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/explore/data/data_source/explore_cubit/explore_cubit.dart';
import 'package:movies/Features/movies/explore/data/data_source/explore_cubit/explore_state.dart';
import 'package:movies/Features/movies/explore/presentation/widgets/explore_custom_item_movie.dart';

class ExploreGridView extends StatelessWidget {
  const ExploreGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreStates>(
      listener: (context, state) {
        if (state is GetExploreLoadingState) {
          Center(child: CircularProgressIndicator());
        } else if (state is GetExploreFailureState) {
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        var exploreCubit = BlocProvider.of<ExploreCubit>(context);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 8),
              itemCount: exploreCubit.exploreMoviesList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ExploreCustomItemMovie(
                  movieModel: exploreCubit.exploreMoviesList[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
