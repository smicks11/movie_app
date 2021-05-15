// // import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:hello_movies/models/movie.dart';
// // import 'package:movie_app/screens/homepage.dart';
// import 'package:movie_app/screens/moviedetail.dart';
// import 'package:movie_app/widgets/customtext.dart';
// import 'package:movie_app/widgets/shimmer_page.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class MoviesWidget extends StatefulWidget {
//   final String title;
//   final String poster;
//   final List<MovieDetails> movies;

//   MoviesWidget({this.movies, this.title, this.poster});

//   @override
//   _MoviesWidgetState createState() => _MoviesWidgetState();
// }

// class _MoviesWidgetState extends State<MoviesWidget> {
//   // List<MovieDetails> _movies = List<MovieDetails>.empty(growable: true);
//   TextEditingController controller = TextEditingController();

//   Future<Null> getMovieDetails() async {
//     final url 
//     final response = await http.get(Uri.parse(url));

//     final responseJson = json.decode(response.body);

//     setState(() {
//       for (Map movie in responseJson) {
//         _movieDetails.add(MovieDetails.fromJson(movie));
//         print(_movieDetails);
//       }
//     });

//     // if (response.statusCode == 200) {
//     //   final responeJson = json.decode(response.body);
//     //   Iterable list = responeJson["Search"];
//     //   return list
//     //       .map((movie) => _movieDetails.add(MovieDetails.fromJson(movie)))
//     //       .toList();
//     // } else {
//     //   throw Exception("Failed to load movies!");
//     // }
//   }

//   //   setState(() {
//   //     for (Map movie in responeJson) {

//   //       // _movieDetails.add(MovieDetails.fromJson(movie));
//   //     }
//   //   });
//   // }

//   @override
//   void initState() {
//     super.initState();

//     getMovieDetails();
//   }

//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     return isLoading
//         ? ShimmerList()
//         : Scaffold(
//             body: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: ListView(children: [
//                   Container(
//                       width: double.infinity,
//                       height: 100,
//                       // color: Colors.blue,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.more_horiz,
//                                 color: Colors.white, size: 40),
//                             onPressed: () {
//                               //     final provider =
//                               //     Provider.of<GoogleSignInProvider>(context, listen: false);
//                               // provider.logout();
//                             },
//                           ),
//                           CircleAvatar(
//                             maxRadius: 28,
//                             backgroundColor: Colors.white,
//                             backgroundImage: NetworkImage(user.photoURL),
//                           )
//                         ],
//                       )),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 12),
//                     width: double.infinity,
//                     height: 100,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Explore",
//                             style: TextStyle(
//                                 fontSize: 36,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700)),
//                         SizedBox(
//                           height: 6,
//                         ),
//                         Text("Let's find your favorite movie",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w200)),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 60,
//                     padding: EdgeInsets.only(left: 10),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 5,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(20),
//                               color: Color(0xff282c35),
//                             ),
//                             child: TextFormField(
//                               controller: controller,
//                               style: TextStyle(color: Colors.white),
//                               cursorColor: Colors.white,
//                               decoration: InputDecoration(
//                                   border: UnderlineInputBorder(
//                                       borderSide: BorderSide.none),
//                                   hintText: "Search...",
//                                   hintStyle: TextStyle(
//                                       fontSize: 18,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w200),
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.grey,
//                                     size: 24,
//                                   )),
//                               onChanged: onSearchTextChanged,
//                               // onChanged: onSearchTextChanged(''),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Container(
//                       child: _searchResult.length != 0 ||
//                               controller.text.isNotEmpty
//                           ? ListView.separated(
//                               scrollDirection: Axis.vertical,
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               separatorBuilder:
//                                   (BuildContext context, int index) =>
//                                       Divider(),
//                               itemCount: _searchResult.length,
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).pushReplacement(
//                                       MaterialPageRoute(
//                                         builder: (ctx) => MovieDetail(
//                                           title: _searchResult[index].title,
//                                           poster: _searchResult[index].poster,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.only(left: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       // height: MediaQuery.of(context).size.height * 0.2,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.4,
//                                             height: 250,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                               image: DecorationImage(
//                                                   fit: BoxFit.fill,
//                                                   image: NetworkImage(
//                                                       _searchResult[index]
//                                                           .poster)),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 2, vertical: 2),
//                                             child: CustomText(
//                                               text: _searchResult[index].title,
//                                               size: 16,
//                                               color: Colors.white,
//                                               weight: FontWeight.w700,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 2),
//                                             child: Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.grey,
//                                                   size: 16,
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             )
//                           : ListView.separated(
//                               scrollDirection: Axis.vertical,
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               separatorBuilder:
//                                   (BuildContext context, int index) =>
//                                       Divider(),
//                               itemCount: _movieDetails.length,
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).pushReplacement(
//                                       MaterialPageRoute(
//                                         builder: (ctx) => MovieDetail(
//                                           title: _movieDetails[index].title,
//                                           poster: _movieDetails[index].poster,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.only(left: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.4,
//                                       // height: MediaQuery.of(context).size.height * 0.2,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.4,
//                                             height: 250,
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                               image: DecorationImage(
//                                                   fit: BoxFit.fill,
//                                                   image: NetworkImage(
//                                                       _movieDetails[index]
//                                                           .poster)),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 2, vertical: 2),
//                                             child: CustomText(
//                                               text: _movieDetails[index].title,
//                                               size: 16,
//                                               color: Colors.white,
//                                               weight: FontWeight.w700,
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 2),
//                                             child: Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.yellow,
//                                                   size: 16,
//                                                 ),
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.grey,
//                                                   size: 16,
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             )),
//                 ])),
//           );
//   }

//   onSearchTextChanged(String text) async {
//     _searchResult.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }

//     _movieDetails.forEach((movieDetail) {
//       if (movieDetail.title.contains(text)) _searchResult.add(movieDetail);
//     });

//     setState(() {});
//   }
// }

// List<MovieDetails> _searchResult = [];

// List<MovieDetails> _movieDetails = [];

// final String url = 'http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa';

// class MovieDetails {
//   final String imdbId;
//   final String poster;
//   final String title;
//   final String year;

//   MovieDetails({this.imdbId, this.title, this.poster, this.year});

//   factory MovieDetails.fromJson(Map<String, dynamic> json) {
//     return MovieDetails(
//         imdbId: json["imdbID"],
//         poster: json["Poster"],
//         title: json["Title"],
//         year: json["Year"]);
//   }
// }
