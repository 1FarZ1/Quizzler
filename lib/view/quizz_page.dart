import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizzler/models/quizz.dart';

import '../core/consts.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);
  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int index = 0;
  List<Question> questions = [];
  double percValue = 0;
  int? correctAnswr;
  int? selectedIndex;
  void manageData(Map data) {
    for (int i = 0; i < data["results"].length; i++) {
      List allAnswers = [];
      allAnswers.addAll(data["results"][i]["incorrect_answers"]);
      allAnswers.add(data["results"][i]["correct_answer"]);
      allAnswers.shuffle();
      questions.add(Question(data["results"][i]["question"],
          allAnswers as String, data["results"][i]["correct_answer"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFECF2),
      // appBar: AppBar(
      //   title: Text('Material App Bar'),
      //   backgroundColor:Color(0xff6A72FF),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 55.0, 32, 10),
        child: SingleChildScrollView(
          child: Column(children: [
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
                    percent: percValue,
                    progressColor: AppColor.thirdColor,
                  ),
                  Container(
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:
                        Image.asset("assets/couronne.png", fit: BoxFit.cover),
                  ),
                  Text("$correctAnswr/8",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
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
                child: Text(questions[index].questionText,
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
                  if (i == 4) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        InkWell(
                          onTap: () {
                            if (index <= 7) {
                              setState(() {
                                if (selectedIndex != 5) {
                                  if (selectedIndex ==
                                      questions[index]
                                          .suggestions
                                          .indexOf(questions[index].answr)) {
                                    percValue += 0.125;
                                    correctAnswr = correctAnswr! + 1;
                                  }
                                  if (index == 7) {
                                    Navigator.pop(context, {
                                      "perc": percValue,
                                      "correct": correctAnswr,
                                    });
                                  } else {
                                    index++;
                                  }

                                  selectedIndex = 5;
                                }
                              });
                            }
                          },
                          child: const SubmitButton(),
                        ),
                      ],
                    );
                  }
                  return ChooseCard(
                      questions[index].suggestions[i], i, selectedIndex!, () {
                    setState(() {
                      if (selectedIndex != i) {
                        selectedIndex = i;
                      } else {
                        selectedIndex = 5;
                      }
                    });
                  });
                }),
          ]),
        ),
      ),
      extendBody: true,
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff654FE5),
                Color(0xffEF3CB0),
              ],
            ),
            borderRadius: BorderRadius.circular(15)),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(75.0, 17, 75, 17),
          child: Text(
            "Valide",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xffEDEAF7),
                fontWeight: FontWeight.w900),
          ),
        ));
  }
}

class ChooseCard extends StatelessWidget {
  String text;
  int index;
  int selectedIndex;
  VoidCallback myfun;
  ChooseCard(this.text, this.index, this.selectedIndex, this.myfun, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        myfun();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: selectedIndex == index
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
                        text,
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
