import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies/view/movies/explore/view/explore_movies_view.dart';
import 'package:movies/view/movies/home/view/home_view.dart';
import 'package:movies/view/movies/profile/view/profile_view.dart';
import 'package:movies/view/movies/search/view/search_view.dart';
import 'package:movies/view_model/app_main_cubit/app_main_state.dart';

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