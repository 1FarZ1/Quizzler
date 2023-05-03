import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/loading_screen.dart';
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
        return const Home();
      },
      "/profile": (context) {
        return const Profile();
      },
      "/splash": (context) {
        return const SplashScreen();
      },
    },
  ));
}
