import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/Features/movies/explore/data/data_source/explore_cubit/explore_state.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class ExploreCubit extends Cubit<ExploreStates>{
  ExploreCubit(super.initialState, this.apiService);
  final ApiService apiService;
  MovieModel? movieModel;
  List<MovieModel> exploreMoviesList = [];
  Future<void> getExploreMovies({required String genre}) async {
    emit(GetExploreLoadingState());
    try {
      var data = await apiService.get(
        endPoint: 'list_movies.json?genre=$genre',
        token: AppText.token ?? '',
      );
      if (data['status'] == 'ok') {
        exploreMoviesList.clear();
        List<dynamic> moviesData = data['data']['movies'];
        for (var item in moviesData) {
          if (item["rating"] != 0.0) {
            exploreMoviesList.add(MovieModel.fromJson(item));
          }
        }

        print('Movies fetched: ${exploreMoviesList.length}');
        emit(GetExploreSuccessState());
      } else {
        emit(GetExploreFailureState(errorMessage: 'No movies found.'));
      }
    } catch (e) {
      if (e is DioException) {
        print('*****************Dio Error: ${e.response?.data}');
        emit(GetExploreFailureState(
            errorMessage:
            e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(GetExploreFailureState(errorMessage: e.toString()));
      }
    }
  }

}