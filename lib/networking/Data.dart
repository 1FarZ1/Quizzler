import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizzler/models/quizz.dart';


const Map TRIVIA_DATA={
  "Mathematics":[19,0,0],
  "History":[23,0,0],
  "Computers":[18,0,0],
  "VideoGames":[15,0,0],
  "Animes":[31,0,0],
};
Map TRIVIA_Slider={
  "Mathematics":[0,0],
  "History":[0,0],
  "Computers":[0,0],
  "VideoGames":[0,0],
  "Animes":[0,0],
};




abstract class QuizzBrain {
  static List Questions = [];
  static Future<List> GetData() async {
    Questions.clear();
    http.Response response = await http.get(Uri.parse(TRIVIA));
    List Data = json.decode(response.body)["results"];
    for (int i = 0; i < Data.length; i++) {
      Questions.add(Question(Data[i]["question"], Data[i]["incorrect_answers"],
          Data[i]["correct_answer"]));
    }
    return Questions ;
  }


}
