// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:movie_app/screens/signup.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// String p =
//     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

// RegExp regExp = new RegExp(p);
// bool obserText = true;
// String email;
// String phoneNumber;
// bool isMale = true;
// String password;
// String userName;

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     void validation() async {
//       final FormState _form = _formKey.currentState;
//       await Firebase.initializeApp();
//       if (!_form.validate()) {
//         try {
//           UserCredential result = await FirebaseAuth.instance
//               .signInWithEmailAndPassword(email: email, password: password);
//         } on PlatformException catch (e) { 
//           print(e.message.toString());
//           // ignore: deprecated_member_use
//           _scaffoldKey.currentState.showSnackBar(
//             SnackBar(
//               content: Text(e.message),
//             ),
//           );
//         }
//       } else {}
//     }

//     return Scaffold(
//         key: _scaffoldKey,
//         resizeToAvoidBottomInset: false,
//         body: SafeArea(
//             child: Form(
//           key: _formKey,
//           child: Container(
//             child: Column(children: [
//               Container(
//                 height: 120,
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text("Welcome Back!",
//                         style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                     SizedBox(height: 12),
//                     Text("Please sign in to your account",
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.white54,
//                             fontWeight: FontWeight.w400))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 height: 500,
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(horizontal: 28),
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(8),
//                         color: Color(0xff282c35),
//                       ),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           setState(() {
//                             email = value;
//                             print(email);
//                           });
//                         },
//                         validator: (value) {
//                           if (value == "") {
//                             return "Please fill Email";
//                           } else if (!regExp.hasMatch(value)) {
//                             return "Email Is Invalid";
//                           }
//                           return "";
//                         },
//                         style: TextStyle(color: Colors.white54),
//                         cursorColor: Colors.white,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 16),
//                           border:
//                               UnderlineInputBorder(borderSide: BorderSide.none),
//                           hintText: "Email Address",
//                           hintStyle: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white24,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(8),
//                         color: Color(0xff282c35),
//                       ),
//                       child: TextFormField(
//                         onChanged: (value) {
//                           setState(() {
//                             password = value;
//                             print(password);
//                           });
//                         },
//                         obscureText: obserText,
//                         validator: (value) {
//                           if (value == "") {
//                             return "Please FIll Password";
//                           } else if (value.length < 8) {
//                             return "Password is too short";
//                           }
//                           return "";
//                         },
//                         style: TextStyle(color: Colors.white54),
//                         cursorColor: Colors.white,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(left: 16),
//                           border:
//                               UnderlineInputBorder(borderSide: BorderSide.none),
//                           hintText: "Password",
//                           suffixIcon: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 obserText = !obserText;
//                               });
//                               FocusScope.of(context).unfocus();
//                             },
//                             child: Icon(
//                               obserText == true
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.black,
//                             ),
//                           ),
//                           hintStyle: TextStyle(
//                               fontSize: 16,
//                               color: Colors.white24,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       height: 180,
//                       width: double.infinity,
//                       margin: EdgeInsets.symmetric(horizontal: 5),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           // ignore: deprecated_member_use
//                           GestureDetector(
//                             onTap: () {
//                               validation();
//                             },
//                             child: Container(
//                               width: double.infinity,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                   color: Colors.blueAccent,
//                                   borderRadius: BorderRadius.circular(20)),
//                               alignment: Alignment.center,
//                               child: Text("Sign In",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                   )),
//                             ),
//                           ),
//                           SizedBox(
//                       height: 20,
//                     ),
//                           Container(
                            
//                             width: double.infinity,
//                             margin: EdgeInsets.symmetric(horizontal: 5),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 // ignore: deprecated_member_use
//                                 GestureDetector(
//                                   onTap: () {
                                    
//                                   },
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     alignment: Alignment.center,
//                                     child: Text("Sign In with Google",
//                                         style: TextStyle(
//                                           color: Colors.blue,
//                                           fontSize: 16,
//                                         )),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 25,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Don't have an Account?",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 14),
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).pushReplacement(
//                                             MaterialPageRoute(
//                                               builder: (ctx) => SignUp(),
//                                             ),
//                                           );
//                                         },
//                                         child: Text(
//                                           "Sign Up",
//                                           style: TextStyle(
//                                               color: Colors.blue, fontSize: 14),
//                                         )),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         )));
//   }
// }
