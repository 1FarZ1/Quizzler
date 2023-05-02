import 'package:flutter/material.dart';
import './Screens/Page.dart';
import './Screens/home.dart';
import './Screens/profile.dart';
import './Screens/splash.dart';
import 'networking/Loading.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 ));
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/loading",
    routes:
  ));
}
