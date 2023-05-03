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

