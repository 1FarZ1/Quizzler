import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../core/consts.dart';
import './profile.dart';
import 'widgets/matiere.dart';

int Correct_answr = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool isPressed = false;
  String userName = "FarZ";
  String age = "18";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                                color: const Color.fromARGB(255, 255, 255, 255),
                                padding: const EdgeInsets.all(7),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 23,
                                  color: Color(0xff4B82EC),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
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
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(userName,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff7A9BFF),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                child: Text("$age ans",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white)),
                              )),
                          const SizedBox(
                            width: 9,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff7A9BFF),
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
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
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff6A72FF),
                          Color(0xff4697FF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(35)),
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, bottom: 5),
                      child: Text("Cette semaine",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xff9FB2BA),
                            fontSize: 19,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ChallangeCard(
                          "$Correct_answr/40",
                          "Bonne reponses",
                          "Obtenues",
                          "assets/couronne.png",
                          "▲ +0%",
                          const Color(0xff11EBA2),
                          AppColor.seconadyColor),
                      const SizedBox(width: 13),
                      ChallangeCard(
                          "5 min.",
                          "Temps passe a",
                          "repondre au quiz",
                          "assets/stopwatch.png",
                          "▲ -2min",
                          const Color(0xffF7A94B),
                          const Color(0xffFFF7E7)),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, top: 20, bottom: 20),
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
                    const Color(0xffF5F0FF),
                    const Color(0xffDED5FF),
                    const Color(0xff8068FF),
                    "Mathematics",
                    "${AppConsts.triviaSlider['Mathematics'][0]}% de reussite",
                    AppConsts.triviaSlider['Mathematics'][0]),
                Matiere(
                    AppColor.fourthColor,
                    AppColor.fifthColor,
                    AppColor.thirdColor,
                    "Computers",
                    "${AppConsts.triviaSlider['Computers'][0]}% de reussite",
                    AppConsts.triviaSlider['Computers'][0]),
                Matiere(
                    const Color(0xffFFF5FC),
                    const Color(0xffFFE7F5),
                    const Color(0xffFF6BC0),
                    "VideoGames",
                    "${AppConsts.triviaSlider['VideoGames'][0]}% de reussite",
                    AppConsts.triviaSlider['VideoGames'][0]),
                Matiere(
                    const Color.fromARGB(255, 217, 239, 238),
                    const Color.fromARGB(255, 189, 233, 228),
                    const Color.fromARGB(255, 8, 235, 216),
                    "History",
                    "${AppConsts.triviaSlider['History'][0]}% de reussite",
                    AppConsts.triviaSlider['History'][0]),
                Matiere(
                    const Color.fromARGB(255, 243, 231, 231),
                    const Color.fromARGB(255, 244, 222, 222),
                    const Color.fromARGB(255, 227, 6, 6),
                    "Animes",
                    "${AppConsts.triviaSlider['Animes'][0]}% de reussite",
                    AppConsts.triviaSlider['Animes'][0]),
                const SizedBox(
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
                    color: isPressed
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
                onPressed: () async {
                  await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 0) {
                isPressed = true;
              } else {
                isPressed = false;
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
  ChallangeCard(this.Bigtxt, this.Midtxt, this.Littxt, this.PathImage,
      this.UpTxt, this.UpTxt1, this.UpTxt2,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 165,
          height: 145,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 175, 186, 195)
                      .withOpacity(0.15),
                  offset: const Offset(0, 15),
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
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.15),
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset:
                              const Offset(0, 15), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset(PathImage, fit: BoxFit.cover),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: UpTxt2,
                          borderRadius: BorderRadius.circular(130)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(7.0, 2.5, 7, 2.5),
                        child: Text(UpTxt,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: UpTxt1)),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(Bigtxt,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: AppColor.primaryColor,
                      ))),
              const SizedBox(height: 5),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(Midtxt,
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                      ))),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(Littxt,
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600))),
            ]),
          )),
    );
  }
}
