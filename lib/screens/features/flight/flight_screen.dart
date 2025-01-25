import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/base/widgets/app_button.dart';
import 'package:flutter_application_1/base/widgets/app_section_heading.dart';
import 'package:flutter_application_1/screens/features/flight/models/airport_model.dart';
import 'package:flutter_application_1/screens/features/flight/widgets/promotion_cards.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> fetchAuthToken() async {
  final String apiKey = dotenv.env['API_KEY'] ?? 'Default API Key';
  final String clientId = dotenv.env['CLIENT_ID'] ?? 'Default Client ID';
  final String clientSecret =
      dotenv.env['CLIENT_SECRET'] ?? 'Default Client Secret';
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  final response = await http.post(
    Uri.parse('$baseUrl/v1/security/oauth2/token'),
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: {
      'client_id': clientId,
      'client_secret': clientSecret,
      'grant_type': 'client_credentials',
    },
  );
  // Debugging API Response
  // print('Response Status: ${response.statusCode}');
  // print('Response Headers: ${response.headers}');
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final token = data['access_token']; // Check for null
    if (token == null) {
      throw Exception('Auth token is null');
    }
    print('Fetched Token: $token'); // Debugging
    return token;
  } else {
    print('Failed to fetch auth token: ${response.body}');
    throw Exception('Failed to fetch auth token');
  }
}

// Function to fetch airports
Future<List<Airport>> fetchAirports(String query) async {
  final String token = await fetchAuthToken(); // Fetch token dynamically
  print('Using Token: $token'); // Debugging token
  // Load values from the .env file

  final String baseUrl =
      dotenv.env['BASE_URL'] ?? 'https://test.api.amadeus.com';

  // Ensure the token is not empty
  if (token.isEmpty) {
    throw Exception('API key is missing');
  }

  // Make the API request using the values from the .env file
  final response = await http.get(
    Uri.parse(
        '$baseUrl/v1/reference-data/locations?subType=AIRPORT&keyword=$query'),
    headers: {
      'Authorization': 'Bearer $token', // Bearer token from .env
    },
  );
  print('Response Status: ${response.statusCode}');
  print('Response Body: ${response.body}'); // Log full response

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    // Ensure 'data' key exists and is a list
    if (jsonResponse['data'] != null && jsonResponse['data'] is List) {
      return (jsonResponse['data'] as List)
          .map((airport) => Airport.fromJson(airport))
          .toList();
    } else {
      print('Error: "data" key is missing or not a list');
      throw Exception('No valid data found in response');
    }
  } else {
    final errorDetails = json.decode(response.body);
    final message = errorDetails['message'] ?? 'Unknown error';
    throw Exception('Error ${response.statusCode}: $message');
  }
}

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  _FlightScreenState createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  // Controllers for text inputs
  final TextEditingController arrivalController = TextEditingController();
  final TextEditingController departureController = TextEditingController();
  List<Airport> _suggestions = [];

  void _updateSuggestions(String query) async {
    if (query.isEmpty) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    try {
      List<Airport> airports = await fetchAirports(query);
      setState(() {
        _suggestions = airports;
      });

      if (airports.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Found ${airports.length} airports',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No airports found for your query',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error fetching airports: $error',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      print('Print = Error fetching airports: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            // SliverAppBar for the search bar and header text
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: AppStyles.bgColor,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "What are \n you looking for ?",
                  style: AppStyles.headLineStyle2
                      .copyWith(fontSize: 29, color: AppStyles.bigDotColor),
                ),
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: AppStyles.profileStatusTextColor,
                ),
              ),
            ),

            // SliverList for the rest of the content
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Departure Input Field with Autocomplete
                    TextField(
                      controller: departureController,
                      onChanged: _updateSuggestions,
                      decoration: InputDecoration(
                        labelText: 'Departure',
                        prefixIcon: Icon(Icons.flight_takeoff_rounded,
                            color: AppStyles.ticketTopColor),
                      ),
                    ),
                    // Suggestions for Departure
                    if (_suggestions.isNotEmpty)
                      SizedBox(
                        height: 200, // Set a fixed height for the suggestions
                        child: ListView.builder(
                          itemCount: _suggestions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_suggestions[index].name),
                              onTap: () {
                                departureController.text = _suggestions[index]
                                    .code; // Set selected airport code
                                setState(() {
                                  _suggestions = []; // Clear suggestions
                                });
                              },
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 15),

                    // Arrival Input Field with Autocomplete
                    TextField(
                      controller: arrivalController,
                      onChanged: _updateSuggestions,
                      decoration: InputDecoration(
                        labelText: 'Arrival',
                        prefixIcon: Icon(Icons.flight_land_rounded,
                            color: AppStyles.ticketBottomColor),
                      ),
                    ),
                    // Suggestions for Arrival
                    if (_suggestions.isNotEmpty)
                      SizedBox(
                        height: 200, // Set a fixed height for the suggestions
                        child: ListView.builder(
                          itemCount: _suggestions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_suggestions[index].name),
                              onTap: () {
                                arrivalController.text = _suggestions[index]
                                    .code; // Set selected airport code
                                setState(() {
                                  _suggestions = []; // Clear suggestions
                                });
                              },
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 30),

                    // Button to find tickets
                    AppButton(
                      label: "Find Tickets",
                      onPressed: () {
                        // Implement functionality to search for tickets
                      },
                    ),
                    const SizedBox(height: 20),

                    // Section Heading with a navigation function
                    AppSectionHeading(
                      leftText: "Upcoming Flights",
                      rightText: "View all",
                      func: () =>
                          Navigator.pushNamed(context, AppRoutes.allTickets),
                    ),
                    SizedBox(height: 15),

                    // PromotionCards Widget (displays promotional content)
                    const PromotionCards(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
