import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/provider/google_sign_in.dart';
import 'package:movie_app/widgets/delayed_list.dart';
// import 'package:movie_app/widgets/movies_widget.dart';
// import 'package:movie_app/widgets/shimmer_page.dart';
// import 'package:movie_app/widgets/movieswid.dart';
// import 'package:movie_app/screens/homepage.dart';
import 'package:movie_app/widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';

class GooglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return DelayedHomeList();
              } else {
                return SignUpWidget();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );
}