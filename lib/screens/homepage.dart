// import 'package:flutter/material.dart';
// // import 'package:movie_app/models/movie_model.dart';
// // import 'package:movie_app/widgets/customtext.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// // import 'package:movie_app/widgets/movieBuild_lst.dart';
// // import 'package:movie_app/widgets/movietestwidget.dart';
// // import 'package:movie_app/widgets/shimmer_page.dart';
// // import 'package:movie_app/widgets/shimmer_page.dart';
// // import 'package:shimmer/shimmer.dart';

// Future<List<Movie>> _fetchAllMovies() async {
//   // final requestUrl = "http://www.omdbapi.com/?i=tt3896198&apikey=d306f3ba";
//   // final requestUrl = "http://www.omdbapi.com/?i=tt3896198&apikey=d306f3ba";

//   // final response = await http.get(Uri.parse(requestUrl));

//   // if (response.statusCode == 200) {
//   //   final result = MovieInfo.fromJson(jsonDecode(response.body));
//   //   Iterable list = result["Search"];
//   //   return list.map((movie) => MovieInfo.fromJson(movie)).toList();
//   // } else {
//   //   throw Exception("Error Loading Request Url Info");
//   // }

//   final response = await http.get(
//       Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa"));

//   if (response.statusCode == 200) {
//     final result = jsonDecode(response.body);
//     Iterable list = result["Search"];
//     return list.map((movie) => Movie.fromJson(movie)).toList();
//   } else {
//     throw Exception("Failed to load movies!");
//   }
// }

// // class MovieInfo {
// //   final String imdbId;
// //   final String title;
// //   final String poster;
// //   final String year;
// //   final String genre;
// //   final String time;
// //   final String plot;
// //   final String award;
// //   final String writer;

// //   MovieInfo(
// //       {@required this.genre,
// //       @required this.time,
// //       @required this.plot,
// //       @required this.award,
// //       @required this.writer,
// //       @required this.imdbId,
// //       @required this.poster,
// //       @required this.title,
// //       @required this.year});

// //   factory MovieInfo.fromJson(Map<String, dynamic> json) {
// //     return MovieInfo(
// //       imdbId: json["imdbID"],
// //       poster: json["Poster"],
// //       title: json["Title"],
// //       year: json["Year"],
// //       genre: json["Genre"],
// //       time: json["Runtime"],
// //       plot: json["Plot"],
// //       award: json["Awards"],
// //       writer: json["Writer"],
// //     );
// //   }
// // }

// class Movie {
//   final String imdbId;
//   final String poster;
//   final String title;
//   final String year;

//   Movie({this.imdbId, this.title, this.poster, this.year});

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//         imdbId: json["imdbID"],
//         poster: json["Poster"],
//         title: json["Title"],
//         year: json["Year"]);
//   }
// }

// class HomePage extends StatefulWidget {
//   final List<Movie> movies;

//   const HomePage({Key key, this.movies});
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isLoading = true;

//   // List<Movie> _movies = List<Movie>();
//   // List<Movie> _movies = List<Movie>.empty(growable: true);

//   @override
//   void initState() {
//     super.initState();
//     _populateAllMovies();
//   }

//   void _populateAllMovies() async {
//     final movies = await _fetchAllMovies();
//     setState(() {
//       _movies = movies;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: MoviesWidget(),
//       // // body: FutureBuilder<Movie>(
//       // //     future: _movies,
//       // //     builder: (context, snapshot) {
//       // //       if (snapshot.hasData) {
//       // //         return BuildMovieList(
//       // //           imdbId: snapshot.data.imdbId,
//       // //           poster: snapshot.data.poster,
//       // //           title: snapshot.data.title,
//       // //           year: snapshot.data.year,
//       // //         );
//       // //         // plot: snapshot.data.plot,
//       // //         // genre: snapshot.data.genre,
//       // //         // award: snapshot.data.award,
//       // //         // writer: snapshot.data.writer,
//       // //         // time: snapshot.data.time);
//       // //       } else if (snapshot.hasError) {
//       // //         return Center(
//       // //           child: Text("${snapshot.error}"),
//       // //         );
//       // //       }

//       // //       return Center(child: CircularProgressIndicator());
//       //     }),
//     );
//   }
// }
