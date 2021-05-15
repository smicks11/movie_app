import 'package:flutter/material.dart';
import 'package:movie_app/screens/moviedetail.dart';

import 'customtext.dart';

class BuildListWidget extends StatefulWidget {
  final String imdbId;
  final String title;
  final String poster;
  final String year;
  final String genre;
  final String plot;
  final String award;
  final String writer;

  const BuildListWidget(
      {Key key,
      this.imdbId,
      this.title,
      this.poster,
      this.year,
      this.genre,
      this.plot,
      this.award,
      this.writer})
      : super(key: key);
  @override
  _BuildListWidgetState createState() => _BuildListWidgetState();
}

class _BuildListWidgetState extends State<BuildListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => MovieDetail(
                title: widget.title,
                poster: widget.poster,
                year: widget.year,
                genre: widget.genre,
                plot: widget.plot,
                award: widget.award,
                writer: widget.writer,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          // height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(widget.poster)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: CustomText(
                  text: widget.title,
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
      ),
    );
  }
}
