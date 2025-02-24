abstract class ProfileStates {}

class GetProfileInitialState extends ProfileStates {}

class GetProfileLoadingState extends ProfileStates {}

class GetProfileSuccessState extends ProfileStates {}

class GetProfileFailureState extends ProfileStates {
  final String? errorMessage;

  GetProfileFailureState({required this.errorMessage});
}