abstract class HomeStates {}

class GetAvailableInitialState extends HomeStates {}

class GetAvailableLoadingState extends HomeStates {}

class GetAvailableSuccessState extends HomeStates {}

class GetAvailableFailureState extends HomeStates {
  final String? errorMessage;

  GetAvailableFailureState({required this.errorMessage});
}

class GetActionInitialState extends HomeStates {}

class GetActionLoadingState extends HomeStates {}

class GetActionSuccessState extends HomeStates {}

class GetActionFailureState extends HomeStates {
  final String? errorMessage;
  GetActionFailureState({required this.errorMessage});
}
