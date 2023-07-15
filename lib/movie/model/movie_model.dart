class MovieModel {
  const MovieModel({
    required this.title,
    required this.urlImage,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  final String title;
  final String urlImage;
  final String overview;
  final String releaseDate;
  final double voteAverage;

}