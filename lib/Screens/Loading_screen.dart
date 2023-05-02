import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _Loading();
}

class _Loading extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
    super.initState();
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
