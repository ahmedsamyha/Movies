import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';
import 'package:movies/model/user_models/UserModel.dart';
import 'package:movies/view_model/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(super.initialState, this.apiService);
  UserModel? userModel;
  final ApiService apiService;
  void createUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId,
  }) async {
    emit(RegisterLoadingState());
    final formData = {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'avaterId': avaterId,
    };

    print('Request Data: $formData');

    try {
      var response = await apiService.post(
        endPoint: 'auth/register',
        token: AppText.token ?? '',
        data: formData,
      );
      print('Full Response: ${response.toString()}');
      userModel = UserModel.fromJson(response);
        emit(RegisterSuccessState());
    } catch (e) {
      if (e is DioException) {
        print('*****************Dio Error: ${e.response?.data}');
        emit(RegisterFailureState(errorMessage: e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(RegisterFailureState(errorMessage:'error'));
      }
    }
  }

}