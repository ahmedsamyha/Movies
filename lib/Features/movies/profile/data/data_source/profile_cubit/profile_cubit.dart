import 'package:bloc/bloc.dart';
import 'package:movies/Features/aouth/data/model/user_models/UserModel.dart';
import 'package:movies/Features/movies/profile/data/data_source/profile_cubit/profile_state.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(super.initialState, this.apiService);

  UserModel? userModel;
  final ApiService apiService;

  Future<void> getProfileMovies() async {
    emit(GetProfileLoadingState());
    try {
      var response = await apiService.getProfile(
        endPoint: 'profile',
        token: AppText.token ?? '',
      );

      if (response.containsKey('data')) {
        userModel = UserModel.fromJson(response['data']);
        emit(GetProfileSuccessState());
      } else {
        emit(GetProfileFailureState(errorMessage: "Invalid response format."));
      }
    } catch (e) {}
  }
}
