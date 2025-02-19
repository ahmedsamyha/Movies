import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies/view/movies/views/explore_movies_view.dart';
import 'package:movies/view/movies/views/home_view.dart';
import 'package:movies/view/movies/views/profile_view.dart';
import 'package:movies/view/movies/views/search_view.dart';
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