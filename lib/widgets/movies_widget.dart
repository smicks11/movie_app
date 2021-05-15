import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/provider/google_sign_in.dart';
import 'package:movie_app/screens/moviedetail.dart';
import 'package:movie_app/widgets/customtext.dart';
// import 'package:movie_app/widgets/shimmer_page.dart';
import 'package:provider/provider.dart';
// import 'package:movie_app/widgets/customtext.dart';

class HomeBuild extends StatefulWidget {
  final Timer timer;

  const HomeBuild({Key key, this.timer}) : super(key: key);

  @override
  _HomeBuildState createState() => _HomeBuildState();
}

class _HomeBuildState extends State<HomeBuild> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getMovieDetails() async {
    final response = await http.get(Uri.parse(url));
    final responseJson = json.decode(response.body);
    Iterable list = responseJson["Search"];

    setState(() {
      for (Map movie in list) {
        _movieDetails.add(MovieDetails.fromJson(movie));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    widget.timer.cancel();
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(children: [
            Container(
                width: double.infinity,
                height: 100,
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon:
                          Icon(Icons.more_horiz, color: Colors.white, size: 40),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logout();
                      },
                    ),
                    CircleAvatar(
                      maxRadius: 28,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(user.photoURL),
                    )
                  ],
                )),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.only(left: 12),
              width: double.infinity,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Explore",
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 6,
                  ),
                  Text("Let's find your favorite movie",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w200)),
                ],
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff282c35),
                      ),
                      child: TextFormField(
                        controller: controller,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Search...",
                            hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                              size: 24,
                            )),
                        onChanged: onSearchTextChanged,
                        // onChanged: onSearchTextChanged(''),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 1000,
              child: _searchResult.length != 0 || controller.text.isNotEmpty
                  ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 6 / 12,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: _searchResult.length,
                      itemBuilder: (BuildContext context, i) {
                        return GestureDetector(
                            // onTap: () {
                            //   Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //       builder: (ctx) => MovieDetail(
                            //         title: _movieDetails[index].title,
                            //         poster: _movieDetails[index].poster,
                            //       ),
                            //     ),
                            //   );
                            // },
                            child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            // height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            _searchResult[i].poster)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 2),
                                  child: CustomText(
                                    text: _searchResult[i].title,
                                    size: 16,
                                    color: Colors.white,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                      },
                    )
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 6 / 12,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: _movieDetails.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => MovieDetail(
                                    title: _movieDetails[index].title,
                                    poster: _movieDetails[index].poster,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                // height: MediaQuery.of(context).size.height * 0.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                _movieDetails[index].poster)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 2),
                                      child: CustomText(
                                        text: _movieDetails[index].title,
                                        size: 16,
                                        color: Colors.white,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.grey,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
            ),
          ])),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _movieDetails.forEach((movieDetail) {
      if (movieDetail.title.contains(text)) _searchResult.add(movieDetail);
    });

    setState(() {});
  }
}

List<MovieDetails> _searchResult = [];

List<MovieDetails> _movieDetails = [];

final String url = 'http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa';

class MovieDetails {
  final String poster;
  final String title;
  final String year;
  final String firstName;
  final String lastName;

  MovieDetails(
      {this.firstName, this.lastName, this.title, this.poster, this.year});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return new MovieDetails(
      title: json["Title"],
      poster: json["Poster"],
      year: json["Year"],
    );
  }
}
