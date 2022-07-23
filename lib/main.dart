import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzler/Screens/Page.dart';
import 'package:quizzler/Screens/home.dart';
import 'package:quizzler/Screens/profile.dart';
import 'package:quizzler/Screens/splash.dart';
import 'networking/Loading.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 ));
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/loading",
    routes: {
      "/home": (context) {
        return Home();
      },
      
      "/profile":(context) {
        return Profile();
      }
      ,
      "/splash":(context) {
        return Splash();
      }
      ,
         "/loading":(context) {
        return Loading();
      }
      // "/Qu
      // izz":Quizz(),
    },
  ));
}
