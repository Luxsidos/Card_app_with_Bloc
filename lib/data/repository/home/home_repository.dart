import 'package:dars_cards/data/models/users.dart';
import 'package:dars_cards/data/provider/api_client.dart';

class HomeRepository {
  ApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<List<Users>> getUsers() async {
    List<Users> response;
    try {
      response = await apiClient.getUsers();
    } catch (e) {
      throw Exception("HAS ERROR $e");
    }
    return response;
  }
}
