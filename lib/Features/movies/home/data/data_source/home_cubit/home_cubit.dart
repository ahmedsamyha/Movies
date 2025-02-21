import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/Features/movies/home/data/data_source/home_cubit/home_state.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(super.initialState, this.apiService);
  final ApiService apiService;
  MovieModel? movieModel;
  List<MovieModel> availableMoviesList = [];

  Future<void> getAvailableMovies() async {
    emit(GetAvailableLoadingState());
    try {
      var data = await apiService.get(
        endPoint: 'list_movies.json?year=2025&limit=10&sort_by=rating',
        token: AppText.token ?? '',
      );
      if (data['status'] == 'ok') {
        availableMoviesList.clear(); // Clear previous data
        List<dynamic> moviesData = data['data']['movies'];
        for (var item in moviesData) {
          availableMoviesList.add(MovieModel.fromJson(item));
        }

        print('Movies fetched: ${availableMoviesList.length}');
        emit(GetActionSuccessState());
      } else {
        emit(GetAvailableFailureState(errorMessage: 'No movies found.'));
      }
    } catch (e) {
      if (e is DioException) {
        print('*****************Dio Error: ${e.response?.data}');
        emit(GetAvailableFailureState(
            errorMessage:
                e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(GetAvailableFailureState(errorMessage: 'error'));
      }
    }
  }
}
