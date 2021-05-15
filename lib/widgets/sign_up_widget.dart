import 'package:flutter/material.dart';
import 'package:movie_app/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Form(
          child: Container(
            child: Column(children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Welcome Back!",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(height: 12),
                    Text("Sign in with Google",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white54,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                // height: 100,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    Container(
                      height: 150,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ignore: deprecated_member_use
                          
                          
                          Container(
                            
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // ignore: deprecated_member_use
                                GestureDetector(
                                  onTap: () {
                                    final provider =
                                    Provider.of<GoogleSignInProvider>(context, listen: false);
                                  provider.login();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("images/g-icon.png"),
                                        SizedBox(width: 16),
                                        Text("Sign In with Google",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}