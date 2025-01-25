import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/base/widgets/app_button.dart';
import 'package:flutter_application_1/base/widgets/app_section_heading.dart';
import 'package:flutter_application_1/screens/features/flight/widgets/custom_dropdown.dart';
import 'package:flutter_application_1/base/widgets/input_text.dart';
import 'package:flutter_application_1/controller/flight_api_controller.dart';
import 'package:flutter_application_1/screens/features/flight/widgets/increment_counter.dart';
import 'package:flutter_application_1/screens/features/flight/widgets/promotion_cards.dart';
import 'package:flutter_application_1/screens/features/flight/models/airport_model.dart';
import 'package:get/get.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  _FlightScreenState createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  final TextEditingController arrivalController = TextEditingController();
  final TextEditingController departureController = TextEditingController();
  final TextEditingController travelDateController = TextEditingController();

  List<Airport> _departureSuggestions = [];
  List<Airport> _arrivalSuggestions = [];
  Airport? _selectedDepartureAirport;
  Airport? _selectedArrivalAirport;
  String _selectedClassType = 'Economy'; // Default Class Type
  int _numberOfPassengers = 1; // Default number of passengers
  final FlightApiController _apiController = FlightApiController();

  // Updates airport suggestions based on query
  Future<void> _updateSuggestions(
      String query, TextEditingController controller) async {
    if (query.isEmpty) {
      setState(() {
        if (controller == departureController) {
          _departureSuggestions = [];
        } else if (controller == arrivalController) {
          _arrivalSuggestions = [];
        }
      });
      return;
    }

    try {
      final airports =
          await _apiController.fetchAirports(query); // Use the controller
      setState(() {
        if (controller == departureController) {
          _departureSuggestions = airports;
        } else if (controller == arrivalController) {
          _arrivalSuggestions = airports;
        }
      });

      if (airports.isNotEmpty) {
        _showSnackbar('${airports.length} airports found', Colors.green);
      } else {
        _showSnackbar('No airports found for your query', Colors.orange);
      }
    } catch (error) {
      _showSnackbar('Error: $error', Colors.red);
    }
  }

  // Displays a snackbar with a message
  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: color),
    );
  }

  // Find Tickets button handler
  void _onFindTickets() {
    // Navigate to Restaurant detail page or perform another action
    Navigator.pushNamed(
      context,
      AppRoutes.selectFlight,
      // Pass the correct data (id as int)
    );
    setState(() {
      _selectedDepartureAirport =
          _departureSuggestions.isNotEmpty ? _departureSuggestions.first : null;
      _selectedArrivalAirport =
          _arrivalSuggestions.isNotEmpty ? _arrivalSuggestions.first : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            _buildAppBar(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  // Builds the app bar
  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 200.0,
      iconTheme: IconThemeData(
          color: AppStyles.ticketBGColor), // Change the back icon color here

      floating: false,
      pinned: true,
      backgroundColor: AppStyles.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "Search for flight",
          style: AppStyles.headLineStyle2
              .copyWith(fontSize: 29, color: AppStyles.bigDotColor),
        ),
        background: Container(
          color: AppStyles.profileStatusTextColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }

  // Builds the main content
  Widget _buildContent() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          // Departure Input Field
          InputText(
            label: 'From',
            controller: departureController,
            iconColor: AppStyles.ticketTopColor,
            prefixIcon: Icons.flight_takeoff_rounded,
            onTap: () {
              // Handle tap for suggestions
              _updateSuggestions(departureController.text, departureController);
            },
          ),
          if (_departureSuggestions.isNotEmpty)
            _buildSuggestionsList(departureController),
          const SizedBox(height: 15),

          // Arrival Input Field
          InputText(
            label: 'To',
            controller: arrivalController,
            prefixIcon: Icons.flight_land_rounded,
            iconColor: AppStyles.ticketBottomColor,
            onTap: () {
              // Handle tap for suggestions
              _updateSuggestions(arrivalController.text, arrivalController);
            },
          ),
          if (_arrivalSuggestions.isNotEmpty)
            _buildSuggestionsList(arrivalController),
          const SizedBox(height: 15),

          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Date Input Field
                Expanded(
                  child: InputText(
                    label: 'Travel Date',
                    controller: travelDateController,
                    iconColor: AppStyles.ticketTopColor,
                    prefixIcon: Icons.calendar_today,
                    onTap: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          travelDateController.text =
                              '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                    width:
                        15), // Space between date field and passenger controls
                IncrementCounter(
                  numberOfPassengers: 2,
                  onChanged: (newCount) {
                    // Handle the change in passenger count
                  },
                  leftIcon: Icons.remove_circle_outline,
                  rightIcon: Icons.add_circle_outline,
                  middleIcon: Icons.person,
                  iconSize: 30,
                )
              ],
            ),
          ),

          const SizedBox(height: 30),

          CustomDropdown(
            label: 'Class',
            selectedValue: _selectedClassType,
            items: ['Economy', 'Business', 'First Class'],
            prefixIcon: Icons.airline_seat_recline_extra,
            iconColor: AppStyles.ticketTopColor,
            onChanged: (String? newValue) {
              setState(() {
                _selectedClassType = newValue!;
              });
            },
          ),
          const SizedBox(height: 30),
          // Find Tickets Button
          AppButton(
            label: "Find Tickets",
            onPressed: _onFindTickets, // Handle button press
          ),
          const SizedBox(height: 20),

          // Display selected airports if available
          if (_selectedDepartureAirport != null &&
              _selectedArrivalAirport != null)
            _buildTravelInfo(),

          const SizedBox(height: 20),

          // Upcoming Flights Section
          AppSectionHeading(
            leftText: "Upcoming Flights",
            rightText: "View all",
            func: () => Navigator.pushNamed(context, AppRoutes.allTickets),
          ),
          const SizedBox(height: 15),

          // Promotion Cards
          // const PromotionCards(),
        ]),
      ),
    );
  }

  // Builds a list of airport suggestions
  Widget _buildSuggestionsList(TextEditingController controller) {
    final suggestions = controller == departureController
        ? _departureSuggestions
        : _arrivalSuggestions;

    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final airport = suggestions[index];
          return ListTile(
            title: Text(airport.name),
            onTap: () {
              controller.text = airport.code; // Update the correct field
              setState(() {
                if (controller == departureController) {
                  _departureSuggestions = [];
                  _selectedDepartureAirport = airport;
                } else if (controller == arrivalController) {
                  _arrivalSuggestions = [];
                  _selectedArrivalAirport = airport;
                }
              });
            },
          );
        },
      ),
    );
  }

  // Displays the selected departure and arrival airports
  Widget _buildTravelInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Travel From: ${_selectedDepartureAirport!.name} (${_selectedDepartureAirport!.code})',
          style: AppStyles.headLineStyle2.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Travel To: ${_selectedArrivalAirport!.name} (${_selectedArrivalAirport!.code})',
          style: AppStyles.headLineStyle2.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Travel Date: ${travelDateController.text}',
          style: AppStyles.headLineStyle2.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Passengers: $_numberOfPassengers',
          style: AppStyles.headLineStyle2.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Class Type: $_selectedClassType',
          style: AppStyles.headLineStyle2.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
