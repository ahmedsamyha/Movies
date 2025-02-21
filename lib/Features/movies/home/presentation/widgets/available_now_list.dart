import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_cubit.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_state.dart';

import 'available_now_item.dart';

class AvailableNowList extends StatelessWidget {
  AvailableNowList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetAvailableLoadingState) {
          Center(child: CircularProgressIndicator());
        } else if (state is GetAvailableFailureState) {
          print(state.errorMessage);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return Padding(
          padding: EdgeInsets.only(top: height * .15),
          child: SizedBox(
            height: height * .36,
            child: Swiper(
              itemBuilder: (context, index) {
                return AvailableNowItem(
                    movieModel: cubit.availableMoviesList[index]);
              },
              itemCount: cubit.availableMoviesList.length,
              physics: const BouncingScrollPhysics(),
              loop: false,
              viewportFraction: .5,
              scale: .64,
            ),
          ),
        );
      },
    );
  }
}
