abstract class FavoritesStates {}

class FavoritesInitialState extends FavoritesStates{}
class FavoritesLoadingState extends FavoritesStates{}
class FavoritesSuccessState extends FavoritesStates{}
class FavoritesFailureState extends FavoritesStates{
  final String? errorMessage;
  FavoritesFailureState({required this.errorMessage});
}
class GetFavoritesLoadingState extends FavoritesStates{}
class GetFavoritesSuccessState extends FavoritesStates{}
class GetFavoritesFailureState extends FavoritesStates{
  final String? errorMessage;
  GetFavoritesFailureState({required this.errorMessage});
}
class DeleteFavoriteState extends FavoritesStates{}
class GetISFavoriteState extends FavoritesStates{}
class GetIsFavoriteSuccessState extends FavoritesStates{}
class GetIsFavoriteFailureState extends FavoritesStates{
  final String? errorMessage;
  GetIsFavoriteFailureState({required this.errorMessage});
}
