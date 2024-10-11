import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:streamscape/constants.dart';

class AuthService {
  Future<bool> signup(String displayName, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/users/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'displayName': displayName,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
