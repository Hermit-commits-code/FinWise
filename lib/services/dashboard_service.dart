import 'dart:convert';

import 'package:http/http.dart' as http;

class DashboardService {
  final String baseUrl = 'https://your-api-url.com';

  Future<Map<String, dynamic>> getDashboardData() async {
    final response = await http.get(Uri.parse('$baseUrl/dashboard'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load dashboard data');
    }
  }
}
