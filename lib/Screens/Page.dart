import 'dart:convert';
import 'dart:math';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:mdi/mdi.dart';
import 'package:quizzler/models/quizz.dart';
import 'package:quizzler/networking/Data.dart';
import 'dart:async' as asy;

const Color KPRIMAY = Color(0xff55747E);
const Color KSECONDARY = Color(0XFFE5FEEC);
const Color KTHIRD = Color(0xff28E68E);
const Color KFOUR = Color(0xffF1FFEF);
const Color KFIVE = Color(0xffDDFEE4);

class QuizzPage extends StatefulWidget {
  String model;
  QuizzPage(this.model, {Key? key}) : super(key: key);
  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int index = 0;
  late int selected_card;
  List<Question> Questions = [];
  List Booleans = [];
  double perc_value = 0;
  int correct_answr = 0;
  int selected_index = 5;
  bool saying = true;
  int? my_choice;
  // late List new1;
  // Future<List<Question>> Res() async {
  //  List x = await QuizzBrain.GetQuestion();
  //   return x as Future<List<Question>>;
  // }
  void ManageData(Map data) {
    if (saying) {
      for (int i = 0; i < data["results"].length; i++) {
        List allAnswers = [];
        allAnswers.addAll(data["results"][i]["incorrect_answers"]);
        allAnswers.add(data["results"][i]["correct_answer"]);
        allAnswers.shuffle();

        Questions.add(Question(
            data["results"][i]["question"],
            allAnswers,
            // .add(data["results"][i]["correct_answer"]),
            data["results"][i]["correct_answer"]));
      }
      saying = false;
      for (int i = 0; i < data["results"].length; i++) {}
    } else {
      return;
    }
  }

  int get_cat() {
    return TRIVIA_DATA[widget.model][0];
  }

  @override
  void initState() {
    // Display = Res();
    super.initState();

    // print(Display);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFECF2),
      // appBar: AppBar(
      //   title: Text('Material App Bar'),
      //   backgroundColor:Color(0xff6A72FF),
      // ),

      // temporary solution make everything scrollable

      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 55.0, 32, 10),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: http.get(Uri.parse(
                "${TRIVIA}amount=8&category=${get_cat()}&difficulty=medium&type=multiple")),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                ManageData(jsonDecode(snapshot.data.body));
                return Column(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    width: double.infinity,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LinearPercentIndicator(
                          backgroundColor: const Color(0xffE0E8FF),
                          width: 220.0,
                          lineHeight: 10.0,
                          barRadius: const Radius.circular(40),
                          percent: perc_value,
                          progressColor: KTHIRD,
                        ),
                        Container(
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.asset("assets/couronne.png",
                              fit: BoxFit.cover),
                        ),
                        Text("$correct_answr/8",
                            style: const TextStyle(
                                color: KPRIMAY,
                                fontSize: 20,
                                fontWeight: FontWeight.w800))
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(Questions[index].question_text,
                          style: const TextStyle(
                              color: Color(0xff0B3948),
                              fontSize: 27,
                              fontWeight: FontWeight.w900))),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, i) {
                        if (i >= 0 && i < 4) {
                          try {
                            // print(Questions[index].suggestions);
                            return ChooseCard(Questions[index].suggestions[i],
                                i, selected_index, () {
                              setState(() {
                                if (selected_index != i) {
                                  selected_index = i;
                                } else {
                                  selected_index = 5;
                                }
                              });
                            });
                          } catch (e) {
                            print(e);
                            return const CircularProgressIndicator();
                          }
                        } else if (i == 4) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              InkWell(
                                onTap: () {
                                  if (index <= 7) {
                                    setState(() {
                                      // check if answr ir right
                                      if (selected_index != 5) {
                                        if (selected_index ==
                                            Questions[index]
                                                .suggestions
                                                .indexOf(
                                                    Questions[index].answr)) {
                                          print(
                                              "he is correct $selected_index");

                                          perc_value += 0.125;
                                          correct_answr++;
                                        }
                                        if (index == 7) {
                                          // end of Quizz
                                          print("im her");
                                          Navigator.pop(context, {
                                            "perc": perc_value,
                                            "correct": correct_answr,
                                          });
                                        } else {
                                          index++;
                                        }

                                        selected_index = 5;
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff654FE5),
                                            Color(0xffEF3CB0),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(75.0, 17, 75, 17),
                                      child: Text(
                                        "Valide",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xffEDEAF7),
                                            fontWeight: FontWeight.w900),
                                      ),
                                    )),
                              ),
                            ],
                          );
                        } else {
                          return const Text("no elememt");
                        }
                      }),
                ]);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),

      extendBody: true,
    );
  }
}

class ChooseCard extends StatefulWidget {
  String text;
  int index;
  int selected_index;
  VoidCallback myfun;
  ChooseCard(this.text, this.index, this.selected_index, this.myfun, {Key? key})
      : super(key: key);

  @override
  State<ChooseCard> createState() => _ChooseCardState();
}

class _ChooseCardState extends State<ChooseCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.myfun();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: widget.selected_index == widget.index
                    ? const Color(0xffD742C7)
                    : Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21.0, 15, 15, 10),
              child: Row(
                children: [
                  Column(
                    children: const [
                      SizedBox(
                        height: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xffBCCDEC),
                        radius: 20,
                        child: Icon(
                          Mdi.alphaB,
                          color: Color(0xff4185EA),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 9),
                      Text(
                        widget.text,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color(0xff2E5961),
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
