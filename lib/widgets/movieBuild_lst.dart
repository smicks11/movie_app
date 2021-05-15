// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// // import 'package:movie_app/provider/google_sign_in.dart';
// import 'package:movie_app/screens/moviedetail.dart';
// import 'package:movie_app/widgets/buildList.dart';
// import 'package:movie_app/widgets/shimmer_page.dart';
// import 'package:shimmer/shimmer.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shimmer/shimmer.dart';

// import 'customtext.dart';

// class BuildMovieList extends StatefulWidget {
//   final String imdbId;
//   final String title;
//   final String poster;
//   final String year;
//   final String genre;
//   final String time;
//   final String plot;
//   final String award;
//   final String writer;

//   const BuildMovieList(
//       {Key key,
//       @required this.imdbId,
//       @required this.poster,
//       @required this.title,
//       @required this.year,
//       this.genre,
//       this.time,
//       this.plot,
//       this.award,
//       this.writer})
//       : super(key: key);

//   @override
//   _BuildMovieListState createState() => _BuildMovieListState();
// }

// class _BuildMovieListState extends State<BuildMovieList> {
//   bool isLoading = true;

//   Widget _buildList() {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (ctx) => MovieDetail(
//               title: widget.title,
//               poster: widget.poster,
//               year: widget.year,
//               genre: widget.genre,
//               time: widget.time,
//               plot: widget.plot,
//               award: widget.award,
//               writer: widget.writer,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.4,
//         // height: MediaQuery.of(context).size.height * 0.2,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                     fit: BoxFit.fill, image: NetworkImage(widget.poster)),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//               child: CustomText(
//                 text: widget.title,
//                 size: 16,
//                 color: Colors.white,
//                 weight: FontWeight.w700,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 2),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.star,
//                     color: Colors.yellow,
//                     size: 16,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: Colors.yellow,
//                     size: 16,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: Colors.yellow,
//                     size: 16,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: Colors.yellow,
//                     size: 16,
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: Colors.grey,
//                     size: 16,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Timer timer = Timer(Duration(seconds: 3), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//     final user = FirebaseAuth.instance.currentUser;
//     return isLoading ? ShimmerList() : Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         child: ListView(
//           children: [
//             Container(
//                 width: double.infinity,
//                 height: 100,
//                 // color: Colors.blue,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon:
//                           Icon(Icons.more_horiz, color: Colors.white, size: 40),
//                       onPressed: () {
//                         //     final provider =
//                         //     Provider.of<GoogleSignInProvider>(context, listen: false);
//                         // provider.logout();
//                       },
//                     ),
//                     CircleAvatar(
//                       maxRadius: 28,
//                       backgroundColor: Colors.white,
//                       backgroundImage: NetworkImage(user.photoURL),
//                     )
//                   ],
//                 )),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 12),
//               width: double.infinity,
//               height: 100,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Explore",
//                       style: TextStyle(
//                           fontSize: 36,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700)),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text("Let's find your favorite movie",
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w200)),
//                 ],
//               ),
//             ),
//             Container(
//               height: 60,
//               padding: EdgeInsets.only(left: 10),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(20),
//                         color: Color(0xff282c35),
//                       ),
//                       child: TextFormField(
//                         style: TextStyle(color: Colors.white),
//                         cursorColor: Colors.white,
//                         decoration: InputDecoration(
//                             border: UnderlineInputBorder(
//                                 borderSide: BorderSide.none),
//                             hintText: "Search...",
//                             hintStyle: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w200),
//                             prefixIcon: Icon(
//                               Icons.search,
//                               color: Colors.grey,
//                               size: 24,
//                             )),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               padding: EdgeInsets.only(left: 10),
//               child: Row(
//                 children: [
//                   _buildList(),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   _buildList()
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               padding: EdgeInsets.only(left: 10),
//               child: Row(
//                 children: [
//                   _buildList(),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   _buildList()
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// Adding Shimmer Effect
// class ShimmerEffect extends StatefulWidget {
//   @override
//   _ShimmerEffectState createState() => _ShimmerEffectState();
// }

// class _ShimmerEffectState extends State<ShimmerEffect> {
//   int offset = 0;

//   int time = 800;

//   @override
//   Widget build(BuildContext context) {
//     offset += 5;
//     time = 800 + offset;
//     print(time);
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         child: ListView(
//           children: [
//             Container(
//                 width: double.infinity,
//                 height: 100,
//                 // color: Colors.blue,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Shimmer.fromColors(
//                       highlightColor: Colors.grey[850],
//                       baseColor: Color(0xff16161d),
//                       period: Duration(milliseconds: time),
//                       child: IconButton(
//                         icon: Icon(Icons.more_horiz,
//                             color: Colors.white, size: 40),
//                         onPressed: () {
//                           //     final provider =
//                           //     Provider.of<GoogleSignInProvider>(context, listen: false);
//                           // provider.logout();
//                         },
//                       ),
//                     ),
//                     Shimmer.fromColors(
//                       highlightColor: Colors.grey[850],
//                       baseColor: Color(0xff16161d),
//                       period: Duration(milliseconds: time),
//                       child: CircleAvatar(
//                         maxRadius: 28,
//                         backgroundColor: Colors.white,
//                       ),
//                     )
//                   ],
//                 )),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 12),
//               width: double.infinity,
//               height: 100,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Shimmer.fromColors(
//                     highlightColor: Colors.grey[850],
//                     baseColor: Color(0xff16161d),
//                     period: Duration(milliseconds: time),
//                     child: Text("Explore",
//                         style: TextStyle(
//                             fontSize: 36,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Shimmer.fromColors(
//                     highlightColor: Colors.grey[850],
//                     baseColor: Color(0xff16161d),
//                     period: Duration(milliseconds: time),
//                     child: Text("Let's find your favorite movie",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w200)),
//                   ),
//                 ],
//               ),
//             ),
//             Shimmer.fromColors(
//               highlightColor: Colors.grey[850],
//               baseColor: Color(0xff16161d),
//               period: Duration(milliseconds: time),
//               child: Container(
//                 height: 60,
//                 padding: EdgeInsets.only(left: 10),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 5,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(20),
//                           color: Color(0xff282c35),
//                         ),
//                         child: TextFormField(
//                           style: TextStyle(color: Colors.white),
//                           cursorColor: Colors.white,
//                           decoration: InputDecoration(
//                               border: UnderlineInputBorder(
//                                   borderSide: BorderSide.none),
//                               hintText: "Search...",
//                               hintStyle: TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w200),
//                               prefixIcon: Icon(
//                                 Icons.search,
//                                 color: Colors.grey,
//                                 size: 24,
//                               )),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               padding: EdgeInsets.only(left: 10),
//               child: Row(
//                 children: [
//                   BuildListWidget(),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   BuildListWidget()
//                 ],
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               padding: EdgeInsets.only(left: 10),
//               child: Row(
//                 children: [
//                   BuildListWidget(),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   BuildListWidget()
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
