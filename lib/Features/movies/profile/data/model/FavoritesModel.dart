class FavoritesModel {
  final String movieId;
  final String name;
  final double? rating;
  final String imageURL;
  final String year;

  FavoritesModel({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      movieId: json['movieId'].toString(),
      name: json['name'] ?? 'Unknown',
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'] as double?,
      imageURL: json['imageURL'] ?? '',
      year: json['year'].toString(),
    );
  }
}
