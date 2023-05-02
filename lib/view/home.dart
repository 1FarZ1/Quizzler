import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './Page.dart';
import './profile.dart';


int Correct_answr = 0;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool is_pressed = false;
  String user_name = "FarZ";
  String age = "18";

  Map TRIVIA_Slider = {
    "Mathematics": [0.0, 0.0],
    "History": [0.0, 0.0],
    "Computers": [0.0, 0.0],
    "VideoGames": [0.0, 0.0],
    "Animes": [0.0, 0.0],
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffF9FAFB),
            Color(0xffFEFEFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: Text('Material App Bar'),
        //   backgroundColor:Color(0xff6A72FF),
        // ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              MaterialButton(
                                shape: const CircleBorder(),
                                color: Color.fromARGB(255, 255, 255, 255),
                                padding: const EdgeInsets.all(7),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 23,
                                  color: Color(0xff4B82EC),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
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
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(user_name,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff7A9BFF),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                child: Text("${age} ans",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white)),
                              )),
                          SizedBox(
                            width: 9,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff7A9BFF),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                child: Text("CM1",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white)),
                              )),
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff6A72FF),
                          Color(0xff4697FF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(35)),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, bottom: 5),
                      child: Text("Cette semaine",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xff9FB2BA),
                            fontSize: 19,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ChallangeCard(
                          "${Correct_answr}/40",
                          "Bonne reponses",
                          "Obtenues",
                          "assets/couronne.png",
                          "▲ +0%",
                          Color(0xff11EBA2),
                          KSECONDARY),
                      SizedBox(width: 13),
                      ChallangeCard(
                          "5 min.",
                          "Temps passe a",
                          "repondre au quiz",
                          "assets/stopwatch.png",
                          "▲ -2min",
                          Color(0xffF7A94B),
                          Color(0xffFFF7E7)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, top: 20, bottom: 20),
                      child: Text("PROGRAMMES",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xff9FB2BA),
                            fontSize: 17,
                          )),
                    ),
                  ],
                ),

                Matiere(
                    Color(0xffF5F0FF),
                    Color(0xffDED5FF),
                    Color(0xff8068FF),
                    "Mathematics",
                    "${TRIVIA_Slider['Mathematics'][0]}% de reussite",
                    TRIVIA_Slider['Mathematics'][0]),
                Matiere(
                    KFOUR,
                    KFIVE,
                    KTHIRD,
                    "Computers",
                    "${TRIVIA_Slider['Computers'][0]}% de reussite",
                    TRIVIA_Slider['Computers'][0]),
                Matiere(
                    Color(0xffFFF5FC),
                    Color(0xffFFE7F5),
                    Color(0xffFF6BC0),
                    "VideoGames",
                    "${TRIVIA_Slider['VideoGames'][0]}% de reussite",
                    TRIVIA_Slider['VideoGames'][0]),
                Matiere(
                    Color.fromARGB(255, 217, 239, 238),
                    Color.fromARGB(255, 189, 233, 228),
                    Color.fromARGB(255, 8, 235, 216),
                    "History",
                    "${TRIVIA_Slider['History'][0]}% de reussite",
                    TRIVIA_Slider['History'][0]),
                Matiere(
                    Color.fromARGB(255, 243, 231, 231),
                    Color.fromARGB(255, 244, 222, 222),
                    Color.fromARGB(255, 227, 6, 6),
                    "Animes",
                    "${TRIVIA_Slider['Animes'][0]}% de reussite",
                    TRIVIA_Slider['Animes'][0]),
                SizedBox(
                  height: 50,
                )
                // Matiere(),
                // Matiere(),
                // Matiere()
              ],
            ),
          ),
        ),
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
                onPressed: () async {
                  var result = await await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                  setState(() {
                    try {
                      user_name = result["name"].toString();
                      age = result["age"].toString();
                    } catch (e) {
                      print(e);
                    }
                  });
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

class ChallangeCard extends StatelessWidget {
  String Bigtxt;
  String Midtxt;
  String Littxt;
  String PathImage;
  String UpTxt;
  Color UpTxt1;
  Color UpTxt2;
  ChallangeCard(
    String this.Bigtxt,
    String this.Midtxt,
    String this.Littxt,
    String this.PathImage,
    String this.UpTxt,
    Color this.UpTxt1,
    Color this.UpTxt2,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            width: 165,
            height: 145,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 175, 186, 195).withOpacity(0.15),
                    offset: Offset(0, 15),
                    blurRadius: 3,
                    spreadRadius: -5)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
                            spreadRadius: 3,
                            blurRadius: 15,
                            offset: Offset(0, 15), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(this.PathImage, fit: BoxFit.cover),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: this.UpTxt2,
                            borderRadius: BorderRadius.circular(130)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(7.0, 2.5, 7, 2.5),
                          child: Text(this.UpTxt,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: this.UpTxt1)),
                        )),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(this.Bigtxt,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: KPRIMAY,
                        ))),
                SizedBox(height: 5),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(this.Midtxt,
                        style: TextStyle(
                          color: KPRIMAY,
                          fontWeight: FontWeight.w600,
                        ))),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(this.Littxt,
                        style: TextStyle(
                            color: KPRIMAY, fontWeight: FontWeight.w600))),
              ]),
            )),
      ),
    );
  }
}

class Matiere extends StatefulWidget {
  Color BigColor;
  Color MidColor;
  Color SliderColor;
  String BigText;
  String LitText;
  double Perc;
  Matiere(
    Color this.BigColor,
    Color this.MidColor,
    Color this.SliderColor,
    String this.BigText,
    String this.LitText,
    double this.Perc,
  );

  @override
  State<Matiere> createState() => _MatiereState();
}

class _MatiereState extends State<Matiere> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: InkWell(
        onTap: () async {
          try {
            // will implent this later using bloc ; now its kinda complicated
            var result = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QuizzPage(this.widget.BigText)));
            print(result);
            var temp1 = result["correct"];

            setState(() {
              Correct_answr = Correct_answr + temp1 as int;
            });

            if (result["perc"] * 100 > this.widget.Perc) {
              setState(() {
                this.widget.Perc = result["perc"] * 100;
                var temp = result["perc"] * 100;
                this.widget.LitText = "${temp}% de reussite";
              });
            }
          } catch (e) {
            print(e);
          }
        },
        child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
                color: this.widget.BigColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21.0, 15, 15, 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 3,
                      ),
                      CircleAvatar(
                        backgroundColor: this.widget.MidColor,
                        radius: 20,
                        child: Icon(
                          Icons.history_edu,
                          color: this.widget.SliderColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.widget.BigText,
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff2E5961),
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 1),
                        Text(this.widget.LitText,
                            style: TextStyle(
                                color: this.widget.SliderColor,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LinearPercentIndicator(
                              backgroundColor: this.widget.MidColor,
                              width: 190.0,
                              lineHeight: 10.0,
                              barRadius: Radius.circular(40),
                              percent: this.widget.Perc / 100,
                              progressColor: this.widget.SliderColor,
                            ),
                            SizedBox(
                              width: 3,
                            )
                          ],
                        ),
                      ]),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      SizedBox(height: 13),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff2E5961),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
