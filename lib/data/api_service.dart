import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future getQuizzByCategorie() async {
    try {
      final response = await dio.get(
          'https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple');
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
