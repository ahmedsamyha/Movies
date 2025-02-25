import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/Features/aouth/data/data_source/login_cubit/login_state.dart';
import 'package:movies/Features/aouth/data/model/login_model/LoginModel.dart';
import 'package:movies/core/utility/constants/text_constants.dart';
import 'package:movies/core/utility/helper/network/dio_heper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(super.initialState, this.apiService);
  LoginModel? loginModel;
  final ApiService apiService;
  void userLogin({

    required String email,
    required String password,

  }) async {
    emit(LoginLoadingState());
    final formData = {
      'email': email,
      'password': password,
    };
    print('Request Data: $formData');
    try {
      emit(LoginLoadingState());
      var response = await apiService.post(
        endPoint: 'auth/login',
        token: AppText.token ?? '',
        data: formData,
      );
      print('Full Response: ${response.toString()}');
       loginModel= LoginModel.fromJson(response);
      emit(LoginSuccessState());
      AppText.token = loginModel?.data;
      print('MY Token IS ***************************${AppText.token}');
    } catch (e) {
      if (e is DioException) {
        print('*****************Dio Error: ${e.response?.data}');
        emit(LoginFailureState(errorMessage: e.response?.data.toString() ?? 'Something went wrong.'));
      } else {
        emit(LoginFailureState(errorMessage:'error'));
      }
    }
  }

}