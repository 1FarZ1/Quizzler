import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  static const baseUrl = "https://opentdb.com/api.php";


  Future getQuizzByCategorie({required String category}) async {
    try {
      final response = await dio.get(
          '$baseUrl?amount=10&category=$category&difficulty=easy&type=multiple');
      return response.data;
    } catch (e) {
      return e;
    }
  }
}
