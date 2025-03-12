import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfileService {
  final String baseUrl;

  ProfileService(this.baseUrl);

  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode == 200) {
      try {
        return json.decode(response.body);
      } catch (e) {
        print('Failed to parse profile: ${response.body}');
        throw Exception('Failed to parse profile');
      }
    } else {
      print('Failed to load profile: ${response.body}');
      throw Exception('Failed to load profile');
    }
  }

  Future<void> updateUserProfile(
    String userId,
    Map<String, dynamic> profileData,
  ) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(profileData),
    );

    if (response.statusCode != 200) {
      print('Failed to update profile: ${response.body}');
      throw Exception('Failed to update profile');
    }
  }
}
