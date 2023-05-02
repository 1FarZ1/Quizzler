abstract class QuizzRepo{
  Future<List<Map<String, dynamic>>> getQuizz();
  Future<List<Map<String, dynamic>>> getQuizzByCategory(String category);
}

class QuizRepoImpl implements QuizzRepo{
  @override
  Future<List<Map<String, dynamic>>> getQuizz() {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getQuizzByCategory(String category) {
    throw UnimplementedError();
  }

}


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

