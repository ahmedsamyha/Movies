import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/Features/movies/profile/data/data_source/favorites_cubit/favorites_states.dart';
import 'package:movies/Features/movies/profile/data/model/FavoritesModel.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit(super.initialState, this.apiService);
  FavoritesModel? favoritesModel;
  final ApiService apiService;
  void addFavorites({
    required String movieId,
    required String name,
    required double rating,
    required String imageURL,
    required String year,
  }) async {
    emit(FavoritesLoadingState());

    final formData = {
      'movieId': movieId,
      'name': name,
      'rating': rating,
      'imageURL': imageURL,
      'year': year,
    };

    print('Sending Favorite Request: $formData');

    try {
      var response = await apiService.postFavorites(
        endPoint: 'favorites/add',
        token: AppText.token ?? '',
        data: formData,
      );

      print('Favorite Added: ${response.toString()}');

      favoritesModel = FavoritesModel.fromJson(response);
      emit(FavoritesSuccessState());
    } catch (e) {
      if (e is DioException) {
        print('Dio Error: ${e.response?.statusCode} - ${e.response?.data}');
        emit(FavoritesFailureState(
            errorMessage:
                e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(FavoritesFailureState(errorMessage: e.toString()));
      }
    }
  }

  List<FavoritesModel> faveMoviesList = [];
  Future<void> getFavoritesMovies() async {
    emit(GetFavoritesLoadingState());
    try {
      var data = await apiService.getFavorites(
        endPoint: 'favorites/all',
        token: AppText.token ?? '',
      );
      if (data['message'] == 'favourites fetched successfully') {
        faveMoviesList.clear();
        List<dynamic> moviesData = data['data'];
        for (var item in moviesData) {
          if (item["rating"] != 0.0) {
            faveMoviesList.add(FavoritesModel.fromJson(item));
          }
        }

        print('Movies fetched: ${faveMoviesList.length}');
        emit(GetFavoritesSuccessState());
      } else {
        emit(GetFavoritesFailureState(errorMessage: 'No movies found.'));
      }
    } catch (e) {
      if (e is DioException) {
        print('*****************Dio Error: ${e.response?.data}');
        emit(GetFavoritesFailureState(
            errorMessage:
                e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(GetFavoritesFailureState(errorMessage: e.toString()));
      }
    }
  }

  Future<void> deleteFavorite({required int id}) async {
    apiService.deleteFavorites(
      endPoint: 'favorites/remove/$id',
      token: AppText.token ?? '',
    );
    emit(DeleteFavoriteState());
  }

  Future<void> getIsFaveMovies({required int movieId}) async {
    var data = await apiService.getFavorites(
      endPoint: 'favorites/is-favorite/$movieId',
      token: AppText.token ?? '',
    );
    if (data['message'] == 'favourites fetched successfully') {
      if (data['data'] == true) {
        AppText.isFave = true;
      } else {
        AppText.isFave = false;
      }
      emit(GetFavoritesSuccessState());
    }
  }
}
