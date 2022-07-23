import 'dart:async';

import 'package:flutter/material.dart';
import 'Data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _Loading();
}

class _Loading extends State<Loading> {
  

  @override
  void initState() {
     Timer(Duration(seconds: 3), () {
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
      decoration: BoxDecoration(
         gradient: LinearGradient(
                                           begin: Alignment.bottomLeft,
                                           end: Alignment.topRight,
                                           colors: [
                                             Color(0xff654FE5),
                                             Color(0xffEF3CB0),
                                           ],
                                         ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body:Center(
        child: spinkit,
          ) 
          ),
    );
  }
}