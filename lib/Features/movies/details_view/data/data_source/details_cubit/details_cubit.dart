import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/Features/movies/details_view/data/data_source/details_cubit/details_state.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class DetailsCubit extends Cubit<DetailsStates>{
  DetailsCubit(super.initialState, this.apiService);
  final ApiService apiService;
  MovieModel? movieModel;
  List<MovieModel> similarMoviesList = [];
  Future<void> getDetailsMovies({required String genre}) async {
    emit(GetDetailsLoadingState());
    try {
      var data = await apiService.get(
        endPoint: 'list_movies.json?genre=$genre',
        token: AppText.token ?? '',
      );
      if (data['status'] == 'ok') {
        similarMoviesList.clear();
        List<dynamic> moviesData = data['data']['movies'];
        for (var item in moviesData) {
          if (item["rating"] != 0.0) {
            similarMoviesList.add(MovieModel.fromJson(item));
          }
        }

        print('Movies fetched: ${similarMoviesList.length}');
        emit(GetDetailsSuccessState());
      } else {
        emit(GetDetailsFailureState(errorMessage: 'No movies found.'));
      }
    } catch (e) {
      if (e is DioException) {
        print('*****************Dio Error: ${e.response?.data}');
        emit(GetDetailsFailureState(
            errorMessage:
            e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(GetDetailsFailureState(errorMessage: e.toString()));
      }
    }
  }

}