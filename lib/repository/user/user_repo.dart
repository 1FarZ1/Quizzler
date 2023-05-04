import 'package:quizzler/data/api_service.dart';

abstract class UserRepo {
  Future<List<Map<String, dynamic>>?> logIn();
  Future<List<Map<String, dynamic>>?> getUserData();
}

class UserRepoImpl implements UserRepo {
  final ApiService apiService;

  UserRepoImpl(this.apiService);
  @override
  Future<List<Map<String, dynamic>>?> getUserData() async {
    try {
      final response = await apiService.getQuizzByCategorie(category: "23");
      return response.data;
    } catch (e) {
      return null;
    }
  }
  @override
  Future<List<Map<String, dynamic>>?> login() async {
    try {
      final response = await apiService.getQuizzByCategorie(category: "23");
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
