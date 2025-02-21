abstract class ExploreStates {}

class GetExploreInitialState extends ExploreStates {}

class GetExploreLoadingState extends ExploreStates {}

class GetExploreSuccessState extends ExploreStates {}

class GetExploreFailureState extends ExploreStates {
  final String? errorMessage;

  GetExploreFailureState({required this.errorMessage});
}
