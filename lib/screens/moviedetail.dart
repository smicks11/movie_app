import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/models/cast.dart';
import 'package:movie_app/widgets/customtext.dart';
import 'package:movie_app/widgets/mov_wid_2.dart';
import 'package:movie_app/widgets/movies_widget.dart';
// import 'package:movie_app/widgets/movieswid.dart';
// import 'package:movie_app/widgets/movieBuild_lst.dart';

// import 'homepage.dart';

List<Cast> castList = [
  Cast(
      name: "Chris Evonik",
      image: "images/profile.jpg",
      subName: "West Morgan"),
  Cast(
      name: "Beauty Eunice",
      image: "images/profile.jpg",
      subName: "Betty Levitte"),
  Cast(name: "Wes Morgan", image: "images/profile.jpg", subName: "Queen Tasha"),
  Cast(
      name: "Sandra Taylor",
      image: "images/profile.jpg",
      subName: "Tasha cobbs"),
  Cast(
      name: "Sandra Taylor",
      image: "images/profile.jpg",
      subName: "Tasha cobbs"),
];

class MovieDetail extends StatefulWidget {
  final List<MovieDetails> movies;
  final String title;
  final String poster;
  final String year;
  final String genre;
  final String time;
  final String plot;
  final String award;
  final String writer;
  final Timer timer;

  const MovieDetail(
      {Key key,
      this.title,
      this.poster,
      this.year,
      this.genre,
      this.time,
      this.plot,
      this.award,
      this.writer,
      this.movies, this.timer})
      : super(key: key);
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    
    // final movie = widget.movies;
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Color(0xff16161d),
        //   leading: Icon(Icons.arrow_back),
        //   actions: [
        //     Icon(Icons.favorite_border_outlined)
        //   ],
        // ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView(children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.poster),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 110.0,
                  //   child: SizedBox(
                  //     width: 250.0,
                  //     child: Image.asset(featuredContent.titleImageUrl),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 70.0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 10,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 24),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => HomeBuildTwo()));
                          // Navigator.of(context, rootNavigator: true).pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40.0,
                    child: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "2020",
                            style: TextStyle(
                                color: Colors.white24,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(width: 9.0),
                          Text(
                            "Action",
                            style: TextStyle(
                                color: Colors.white24,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          SizedBox(width: 9.0),
                          Text(
                            "2h 48min",
                            style: TextStyle(
                                color: Colors.white24,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 18,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 18,
                            )
                          ],
                        )),
                  ),
                ],
              ),

              //       alignment: Alignment.bottomCenter,
              //       padding: EdgeInsets.only(bottom: 15),
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(children: [
              //
              //           ]),
              //
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                        text: "Plot Summary", size: 20, color: Colors.white),
                    SizedBox(
                      height: 16,
                    ),
                    CustomText(
                      text: "${widget.plot}",
                      size: 16,
                      color: Colors.white24,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomText(text: "Awards", size: 20, color: Colors.white),
                    SizedBox(
                      height: 16,
                    ),
                    CustomText(
                      text: "${widget.award}",
                      size: 16,
                      color: Colors.white24,
                      weight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(text: "Cast", size: 20, color: Colors.white),
              ),
              SizedBox(height: 8),
              Container(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: castList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 32,
                              backgroundImage:
                                  AssetImage(castList[index].image),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              castList[index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              castList[index].subName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ])));
  }
}
