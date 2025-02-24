abstract class DetailsStates {}

class GetDetailsInitialState extends DetailsStates {}

class GetDetailsLoadingState extends DetailsStates {}

class GetDetailsSuccessState extends DetailsStates {}

class GetDetailsFailureState extends DetailsStates {
  final String? errorMessage;

  GetDetailsFailureState({required this.errorMessage});
}
