import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future getQuizzByCategorie({required String category}) async {
    try {
      final response = await dio.get(
          'https://opentdb.com/api.php?amount=10&category=$category&difficulty=easy&type=multiple');
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
