// lib/viewmodels/movie_model.dart
class MovieModel {
  final String image;
  final String title;
  final String duration;
  final String genres;
  final String releaseDate;
  final String synopsis;
  final List<String> directors;
  final List<Map<String, String>> cast;

  MovieModel({
    required this.image,
    required this.title,
    required this.duration,
    required this.genres,
    required this.releaseDate,
    required this.synopsis,
    required this.directors,
    required this.cast,
  });
}

// Example list of movies
final List<MovieModel> movieList = [
  MovieModel(
    image: "assets/images/madha_raja.jpg",
    title: "Madha Gaja Raja",
    duration: "2h 30m",
    genres: "ACTION, SCI-FI, DRAMA | 2D, 3D, \nDOLBY ATMOS | U/A",
    releaseDate: "January 24, 2025",
    synopsis:
        "After receiving an unexpected call from her \nwayfinding ancestors, Moana must journey to the far \nseas of Oceania and into dangerous, long-lost waters \nfor an adventure unlike anything she's ever faced.",
    directors: ["Dana Ledoux Miller", "Jason Hand", "David Derrick Jr."],
    cast: [
      {"name": "Dwayne Johnson", "image": "assets/images/dwayne.jpg"},
      {"name": "Nicole Scherzinger", "image": "assets/images/nicole.jpg"},
      {"name": "Awhimai Fraser ", "image": "assets/images/awhimai.jpg"},
      {"name": "Rose Matafeo ", "image": "assets/images/rose.jpg"},
      {"name": "Alan Tudyk", "image": "assets/images/alan.webp"},
      {"name": "Rachel House", "image": "assets/images/rachel.jpg"},
    ],
  ),
  MovieModel(
    image: "assets/images/Moana2.jpg",
    title: "Moana 2",
    duration: "2h 30m",
    genres: "ACTION, SCI-FI, DRAMA | 2D, 3D, \nDOLBY ATMOS | U/A",
    releaseDate: "January 24, 2025",
    synopsis:
        "After receiving an unexpected call from her \nwayfinding ancestors, Moana must journey to the far \nseas of Oceania and into dangerous, long-lost waters \nfor an adventure unlike anything she's ever faced.",
    directors: ["Dana Ledoux Miller", "Jason Hand", "David Derrick Jr."],
    cast: [
      {"name": "Dwayne Johnson", "image": "assets/images/dwayne.jpg"},
      {"name": "Nicole Scherzinger", "image": "assets/images/nicole.jpg"},
      {"name": "Awhimai Fraser ", "image": "assets/images/awhimai.jpg"},
      {"name": "Rose Matafeo ", "image": "assets/images/rose.jpg"},
      {"name": "Alan Tudyk", "image": "assets/images/alan.webp"},
      {"name": "Rachel House", "image": "assets/images/rachel.jpg"},
    ],
  ),
  MovieModel(
    image: "assets/images/game.jpg",
    title: "Game Changer",
    duration: "2h 30m",
    genres: "ACTION, SCI-FI, DRAMA | 2D, 3D, \nDOLBY ATMOS | U/A",
    releaseDate: "January 24, 2025",
    synopsis:
        "After receiving an unexpected call from her \nwayfinding ancestors, Moana must journey to the far \nseas of Oceania and into dangerous, long-lost waters \nfor an adventure unlike anything she's ever faced.",
    directors: ["Dana Ledoux Miller", "Jason Hand", "David Derrick Jr."],
    cast: [
      {"name": "Dwayne Johnson", "image": "assets/images/dwayne.jpg"},
      {"name": "Nicole Scherzinger", "image": "assets/images/nicole.jpg"},
      {"name": "Awhimai Fraser ", "image": "assets/images/awhimai.jpg"},
      {"name": "Rose Matafeo ", "image": "assets/images/rose.jpg"},
      {"name": "Alan Tudyk", "image": "assets/images/alan.webp"},
      {"name": "Rachel House", "image": "assets/images/rachel.jpg"},
    ],
  ),
  MovieModel(
    image: "assets/images/sonic3.jpeg",
    title: "The Hedgehog 3",
    duration: "2h 30m",
    genres: "ACTION, SCI-FI, DRAMA | 2D, 3D, \nDOLBY ATMOS | U/A",
    releaseDate: "January 24, 2025",
    synopsis:
        "After receiving an unexpected call from her \nwayfinding ancestors, Moana must journey to the far \nseas of Oceania and into dangerous, long-lost waters \nfor an adventure unlike anything she's ever faced.",
    directors: ["Dana Ledoux Miller", "Jason Hand", "David Derrick Jr."],
    cast: [
      {"name": "Dwayne Johnson", "image": "assets/images/dwayne.jpg"},
      {"name": "Nicole Scherzinger", "image": "assets/images/nicole.jpg"},
      {"name": "Awhimai Fraser ", "image": "assets/images/awhimai.jpg"},
      {"name": "Rose Matafeo ", "image": "assets/images/rose.jpg"},
      {"name": "Alan Tudyk", "image": "assets/images/alan.webp"},
      {"name": "Rachel House", "image": "assets/images/rachel.jpg"},
    ],
  ),
  MovieModel(
    image: "assets/images/denof.jpeg",
    title: "Den of Thieves 2 Pantera",
    duration: "2h 30m",
    genres: "ACTION, SCI-FI, DRAMA | 2D, 3D, \nDOLBY ATMOS | U/A",
    releaseDate: "January 24, 2025",
    synopsis:
        "After receiving an unexpected call from her \nwayfinding ancestors, Moana must journey to the far \nseas of Oceania and into dangerous, long-lost waters \nfor an adventure unlike anything she's ever faced.",
    directors: ["Dana Ledoux Miller", "Jason Hand", "David Derrick Jr."],
    cast: [
      {"name": "Dwayne Johnson", "image": "assets/images/dwayne.jpg"},
      {"name": "Nicole Scherzinger", "image": "assets/images/nicole.jpg"},
      {"name": "Awhimai Fraser ", "image": "assets/images/awhimai.jpg"},
      {"name": "Rose Matafeo ", "image": "assets/images/rose.jpg"},
      {"name": "Alan Tudyk", "image": "assets/images/alan.webp"},
      {"name": "Rachel House", "image": "assets/images/rachel.jpg"},
    ],
  ),
];
