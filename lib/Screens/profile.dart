import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool checkedValue = false;
  int _currentIndex = 0;
  bool is_pressed = false;
  final titleController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF9FAFB),
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Color(0xFFBFBFBF)),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                Text("Complete Profile",
                    style: TextStyle(color: Colors.black, fontSize: 40)),
                SizedBox(
                  height: 15,
                ),
                Text("Complete Your details or connect",
                    style: TextStyle(color: Colors.grey)),
                SizedBox(
                  height: 5,
                ),
                Text("with social media", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 25),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 53.4,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/mypic.jpg",
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: "   Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 70,
                      ),
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     print("pressed");
                      //   },
                      //   icon: Icon(Icons.mail_outline),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70.0),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 119, 118, 118)),
                      hintText: "  Modify Your name",
                      fillColor: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                      labelText: "  Age",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 70,
                      ),
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     print("pressed");
                      //   },
                      //   icon: Icon(Icons.lock),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70.0),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 119, 118, 118)),
                      hintText: "  Modify Your Age",
                      fillColor: Colors.white),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "  Adress",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 70,
                      ),
                      // suffixIcon: IconButton(
                      //   onPressed: () {
                      //     print("pressed");
                      //   },
                      //   icon: Icon(Icons.phone),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70.0),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 119, 118, 118)),
                      hintText: "  Modify Your Adress ",
                      fillColor: Colors.white),
                ),
                SizedBox(height: 40),
                ButtonTheme(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff6A72FF),
                      fixedSize: const Size(350, 55),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Continue'),
                    onPressed: () {
                      Navigator.pop(context, {
                        "name": titleController.text,
                        "age":ageController.text
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: CustomNavigationBar(
          elevation: 0,
          iconSize: 35.0,
          selectedColor: Color(0xff4696FF),
          strokeColor: Colors.white,
          unSelectedColor: Color(0xff0A3847),
          backgroundColor: Color(0xffF4F4FF),
          borderRadius: Radius.circular(20.0),
          blurEffect: true,
          opacity: 0.8,
          items: [
            CustomNavigationBarItem(
              title: Text(
                "mes enfants",
                style: TextStyle(
                    color: is_pressed ? Color(0xff4696FF) : Color(0xff0A3847),
                    fontWeight: FontWeight.w900,
                    fontSize: 15),
              ),
              icon: Icon(
                Icons.stacked_line_chart_rounded,
              ),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_outlined),
            ),
            CustomNavigationBarItem(
              icon: IconButton(
                icon: Icon(AntDesign.user),
                onPressed: () {
                  Navigator.pushNamed(context, "/profile");
                },
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              print(_currentIndex);
              _currentIndex = index;
              if (index == 0) {
                is_pressed = true;
              } else {
                is_pressed = false;
              }
            });
          },
          isFloating: true,
        ),
        extendBody: true,
      ),
    );
  }
}
