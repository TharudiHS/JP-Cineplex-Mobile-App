// lib/viewmodels/movie_model.dart
class MovieModel {
  final String image;
  final String title;
  final String duration;

  MovieModel({
    required this.image,
    required this.title,
    required this.duration,
  });
}

// Example list of movies
final List<MovieModel> movieList = [
  MovieModel(
    image: "assets/images/madha_raja.jpg",
    title: "Madha Gaja Raja",
    duration: "2h 30m",
  ),
  MovieModel(
    image: "assets/images/Moana2.jpg",
    title: "Moana 2",
    duration: "2h 30m",
  ),
  MovieModel(
    image: "assets/images/game.jpg",
    title: "Game Changer",
    duration: "2h 30m",
  ),
  MovieModel(
    image: "assets/images/sonic3.jpeg",
    title: "The Hedgehog 3",
    duration: "2h 30m",
  ),
  MovieModel(
    image: "assets/images/denof.jpeg",
    title: "Den of Thieves 2 Pantera",
    duration: "2h 30m",
  ),
];
