import 'dart:convert';
import 'package:flutter_application_1/screens/features/flight/models/airport_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

// API Controller for managing Flight-related requests
class FlightApiController {
  // Fetches the authentication token
  Future<String> fetchAuthToken() async {
    final String baseUrl = dotenv.env['BASE_URL'] ?? '';
    final String clientId = dotenv.env['CLIENT_ID'] ?? '';
    final String clientSecret = dotenv.env['CLIENT_SECRET'] ?? '';

    final response = await http.post(
      Uri.parse('$baseUrl/v1/security/oauth2/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['access_token'] ??
          (throw Exception('Token is null'));
    } else {
      throw Exception('Failed to fetch auth token: ${response.body}');
    }
  }

  // Fetches a list of airports based on the search query
  Future<List<Airport>> fetchAirports(String query) async {
    final String baseUrl = dotenv.env['BASE_URL'] ?? '';
    final String token = await fetchAuthToken();

    final response = await http.get(
      Uri.parse(
          '$baseUrl/v1/reference-data/locations?subType=AIRPORT&keyword=$query'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      if (data is List) {
        return data.map((json) => Airport.fromJson(json)).toList();
      } else {
        throw Exception('Invalid data format in response');
      }
    } else {
      throw Exception('Failed to fetch airports: ${response.body}');
    }
  }
}
