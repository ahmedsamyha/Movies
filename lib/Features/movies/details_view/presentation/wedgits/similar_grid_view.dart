import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/details_view/data/data_source/details_cubit/details_cubit.dart';
import 'package:movies/Features/movies/details_view/data/data_source/details_cubit/details_state.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/custom_similer_item.dart';
import 'package:movies/Features/movies/details_view/presentation/wedgits/shimmer_similar_grid_view.dart';

import '../../../explore/presentation/widgets/explore_shimmer_grid_view.dart';

class SimilarGridView extends StatelessWidget {
  const SimilarGridView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<DetailsCubit, DetailsStates>(
      builder: (context, state) {
        var detailsCubit = BlocProvider.of<DetailsCubit>(context);

        if (state is GetDetailsLoadingState) {
          return SimilarShimmerGridView();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 8),
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CustomSimilarItem(movieModel: detailsCubit.similarMoviesList[index],);
            },
          ),
        );
      },
    );
  }
}
