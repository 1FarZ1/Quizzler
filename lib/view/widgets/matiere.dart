
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../quizz_page.dart';
import '../home.dart';

class Matiere extends StatefulWidget {
  Color bigColor;
  Color midColor;
  Color sliderColor;
  String bigText;
  String litText;
  double perc;
  Matiere(this.bigColor, this.midColor, this.sliderColor, this.bigText,
      this.litText, this.perc,
      {Key? key})
      : super(key: key);

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
            var result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const QuizzPage()));
            var temp1 = result["correct"];

            setState(() {
              Correct_answr = Correct_answr + temp1 as int;
            });

            if (result["perc"] * 100 > widget.perc) {
              setState(() {
                widget.perc = result["perc"] * 100;
                var temp = result["perc"] * 100;
                widget.litText = "$temp% de reussite";
              });
            }
        },
        child: Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
                color: widget.bigColor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(21.0, 15, 15, 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      CircleAvatar(
                        backgroundColor: widget.midColor,
                        radius: 20,
                        child: Icon(
                          Icons.history_edu,
                          color: widget.sliderColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.bigText,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff2E5961),
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 1),
                        Text(widget.litText,
                            style: TextStyle(
                                color: widget.sliderColor,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LinearPercentIndicator(
                              backgroundColor: widget.midColor,
                              width: 190.0,
                              lineHeight: 10.0,
                              barRadius: const Radius.circular(40),
                              percent: widget.perc / 100,
                              progressColor: widget.sliderColor,
                            ),
                            const SizedBox(
                              width: 3,
                            )
                          ],
                        ),
                      ]),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
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
