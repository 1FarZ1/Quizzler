import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/home.dart';
import 'Screens/profile.dart';
import 'Screens/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/splash",
    routes: {
      "/home": (context) {
        return Home();
      },

      "/profile": (context) {
        return Profile();
      },
      "/splash": (context) {
        return const Splash();
      },
      // "/Qu
      // izz":Quizz(),
    },
  ));
}
