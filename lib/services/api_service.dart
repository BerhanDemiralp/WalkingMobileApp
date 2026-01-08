import 'package:keepintouch/models/models.dart';
import 'package:keepintouch/data/mock_data.dart';

class ApiService {
  Future<User?> login(String identifier, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      // Check if user exists in mock data by email or username
      final user = mockUsers.firstWhere(
        (u) => (u.email == identifier || u.username == identifier) && password == '123',
      );
      
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> register(String email, String password, String name) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
