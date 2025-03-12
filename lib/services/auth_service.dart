import 'dart:convert';

import 'package:http/http.dart' as http;

// A service class for handling authentication-related API calls
class AuthService {
  final String baseUrl;

  AuthService(this.baseUrl);

  // Sends a login request to the authentication API.
  Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    return response;
  }

  /// Sends a registration request to the authentication API.
  Future<http.Response> register(
    String email,
    String username,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'username': username,
        'password': password,
      }),
    );
    return response;
  }

  /// Sends a password reset request to the authentication API.
  Future<http.Response> resetPassword(String email) async {
    final url = Uri.parse('$baseUrl/reset-password');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email}),
    );
    return response;
  }
}
