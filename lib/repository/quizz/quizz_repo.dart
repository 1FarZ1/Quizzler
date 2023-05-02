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

