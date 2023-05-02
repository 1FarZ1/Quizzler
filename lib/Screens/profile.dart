import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

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
        backgroundColor: const Color(0xffF9FAFB),
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(color: Color(0xFFBFBFBF)),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
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
                const SizedBox(height: 15),
                const Text("Complete Profile",
                    style: TextStyle(color: Colors.black, fontSize: 40)),
                const SizedBox(
                  height: 15,
                ),
                const Text("Complete Your details or connect",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(
                  height: 5,
                ),
                const Text("with social media",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 25),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 53.4,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/mypic.jpg",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: "   Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIconConstraints: const BoxConstraints(
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
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 119, 118, 118)),
                      hintText: "  Modify Your name",
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                      labelText: "  Age",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIconConstraints: const BoxConstraints(
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
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 119, 118, 118)),
                      hintText: "  Modify Your Age",
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "  Adress",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIconConstraints: const BoxConstraints(
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
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 119, 118, 118)),
                      hintText: "  Modify Your Adress ",
                      fillColor: Colors.white),
                ),
                const SizedBox(height: 40),
                ButtonTheme(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6A72FF),
                      fixedSize: const Size(350, 55),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Continue'),
                    onPressed: () {
                      Navigator.pop(context, {
                        "name": titleController.text,
                        "age": ageController.text
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
              ],
            ),
          ),
        )),
        bottomNavigationBar: CustomNavigationBar(
          elevation: 0,
          iconSize: 35.0,
          selectedColor: const Color(0xff4696FF),
          strokeColor: Colors.white,
          unSelectedColor: const Color(0xff0A3847),
          backgroundColor: const Color(0xffF4F4FF),
          borderRadius: const Radius.circular(20.0),
          blurEffect: true,
          opacity: 0.8,
          items: [
            CustomNavigationBarItem(
              title: Text(
                "mes enfants",
                style: TextStyle(
                    color: is_pressed
                        ? const Color(0xff4696FF)
                        : const Color(0xff0A3847),
                    fontWeight: FontWeight.w900,
                    fontSize: 15),
              ),
              icon: const Icon(
                Icons.stacked_line_chart_rounded,
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.stacked_bar_chart_outlined),
            ),
            CustomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(AntDesign.user),
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
