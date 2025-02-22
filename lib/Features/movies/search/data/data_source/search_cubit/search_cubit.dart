import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/Features/movies/home/data/model/movie_model/MovieModel.dart';
import 'package:movies/Features/movies/search/data/data_source/search_cubit/search_state.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(super.initialState, this.apiService);

  MovieModel? movieModel;
  final ApiService apiService;
  List<MovieModel> searchList = [];
  Future<void> getSearchMovies({required  String title}) async {
    emit(GetSearchLoadingState());
    try {
      var data = await apiService.get(
          endPoint: 'list_movies.json?query_term=$title&limit=10',
          token: AppText.token ?? "");
      if (data['status'] == 'ok') {
        searchList.clear();
        List<dynamic> moviesData = data['data']['movies'];
        for (var item in moviesData) {
          if (item["rating"] != 0.0) {
            searchList.add(MovieModel.fromJson(item));
          }
        }
        print('Movies fetched: ${searchList.length}');
        emit(GetSearchSuccessState());
      }
    } catch (e) {
      if (e is DioException) {
        print('*****************Dio Error: ${e.response?.data}');
        emit(GetSearchFailureState(
            errorMessage:
                e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(GetSearchFailureState(errorMessage: e.toString()));
      }
    }
  }
}
