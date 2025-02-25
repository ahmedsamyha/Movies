class FavoritesModel {
  final String movieId;
  final String name;
  final double? rating; // Nullable double
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
      rating: (json['rating'] is int) // Check if it's int
          ? (json['rating'] as int).toDouble() // Convert to double
          : json['rating'] as double?, // Otherwise, use it as is
      imageURL: json['imageURL'] ?? '',
      year: json['year'].toString(),
    );
  }
}
