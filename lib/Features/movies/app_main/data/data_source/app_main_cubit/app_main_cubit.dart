import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies/Features/movies/app_main/data/data_source/app_main_cubit/app_main_state.dart';
import 'package:movies/Features/movies/explore/presentation/view/explore_movies_view.dart';
import 'package:movies/Features/movies/home/presentation/view/home_view.dart';
import 'package:movies/Features/movies/profile/presentation/view/profile_view.dart';
import 'package:movies/Features/movies/search/presentation/view/search_view.dart';


class AppMainCubit extends Cubit<AppMainState>{
  AppMainCubit(super.initialState);

  List<Widget> screens = [
    HomeView(),
    SearchView(),
    ExploreMoviesView(),
    ProfileView(),
  ];
  int currentIndex = 0;

  void changeSelectedIndex({required int index}) {
    currentIndex = index;
    emit(AppMainSuccessState());
  }
}