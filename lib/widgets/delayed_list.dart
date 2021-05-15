import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movies_widget.dart';
import 'package:movie_app/widgets/shimmer_page.dart';

class DelayedHomeList extends StatefulWidget {
  @override
  _DelayedHomeListState createState() => _DelayedHomeListState();
}

class _DelayedHomeListState extends State<DelayedHomeList> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    return isLoading ? ShimmerList() : HomeBuild(timer: timer,);
  }
}
