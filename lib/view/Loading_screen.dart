import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitRipple(
      color: Color.fromARGB(255, 255, 251, 251),
      size: 100.0,
    );
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff654FE5),
            Color(0xffEF3CB0),
          ],
        ),
      ),
      child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: spinkit,
          )),
    );
  }
}
