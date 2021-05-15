import 'package:flutter/material.dart';
import 'package:movie_app/provider/google_sign_in.dart';
import 'package:movie_app/widgets/sign_up_widget.dart';
import 'package:provider/provider.dart';

class GoogleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: SignUpWidget(),
        )
      
      
    );
  }
}