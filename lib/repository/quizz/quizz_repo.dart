import 'package:quizzler/data/api_service.dart';

abstract class QuizzRepo {
  Future<List<Map<String, dynamic>>?> getQuizzByCategory(
      {required String category});
}

class QuizRepoImpl implements QuizzRepo {
  final ApiService apiService;

  QuizRepoImpl(this.apiService);
  @override
  Future<List<Map<String, dynamic>>?> getQuizzByCategory(
      {required String category}) async {
    try {
      final response = await apiService.getQuizzByCategorie(category: category);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}

const Map TRIVIA_DATA = {
  "Mathematics": [19, 0, 0],
  "History": [23, 0, 0],
  "Computers": [18, 0, 0],
  "VideoGames": [15, 0, 0],
  "Animes": [31, 0, 0],
};
Map TRIVIA_Slider = {
  "Mathematics": [0, 0],
  "History": [0, 0],
  "Computers": [0, 0],
  "VideoGames": [0, 0],
  "Animes": [0, 0],
};
