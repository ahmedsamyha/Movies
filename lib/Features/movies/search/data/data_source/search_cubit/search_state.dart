abstract class SearchStates {}

class GetSearchInitialState extends SearchStates {}

class GetSearchLoadingState extends SearchStates {}

class GetSearchSuccessState extends SearchStates {}

class GetSearchFailureState extends SearchStates {
  final String? errorMessage;

  GetSearchFailureState({required this.errorMessage});
}
