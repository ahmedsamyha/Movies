import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_cubit.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_state.dart';
import 'package:movies/Features/movies/home/presentation/widgets/action_shimmer.dart';

import 'action_item.dart';

class ActionListView extends StatelessWidget {
  const ActionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var actionCubit = BlocProvider.of<HomeCubit>(context);
        if(state is GetActionLoadingState){
          return ActionShimmer();
        }
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
              itemCount: actionCubit.actionMoviesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ActionItem(
                  movieModel: actionCubit.actionMoviesList[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
