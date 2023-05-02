import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/Loading_screen.dart';
import 'view/home.dart';
import 'view/profile.dart';

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
        return const SplashScreen();
      },
    },
  ));
}
