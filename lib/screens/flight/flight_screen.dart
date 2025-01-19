import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/app_section_heading.dart';
import 'package:flutter_application_1/screens/flight/widgets/promotion_cards.dart';
import 'package:flutter_application_1/screens/flight/widgets/tap_bar.dart';

import '../../base/utils/app_routes.dart';
import '../../base/widgets/app_button.dart';
import '../../base/widgets/input_text.dart';

class FlightScreen extends StatelessWidget {
  FlightScreen({super.key});
  final TextEditingController arrivalController = TextEditingController();
  final TextEditingController departureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: null),
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          Text(
            "What are \n you looking for ?",
            style: AppStyles.headLineStyle2.copyWith(fontSize: 45),
          ),
          SizedBox(
            height: 20,
          ),

          InputText(
            label: 'Departure',
            controller: departureController,
            iconColor: AppStyles.ticketTopColor,
            prefixIcon: Icons.flight_takeoff_rounded,
          ),
          const SizedBox(
            height: 15,
          ),
          InputText(
            label: 'Arrival',
            controller: arrivalController,
            iconColor: AppStyles.ticketBottomColor,
            prefixIcon: Icons.flight_land_rounded,
          ),

          const SizedBox(
            height: 30,
          ),

          AppButton(
            label: "find tickets",
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          AppSectionHeading(
            leftText: "Upcoming Flights",
            rightText: "View all ",
            func: () => Navigator.pushNamed(context, AppRoutes.allTickets),
          ),
          SizedBox(
            height: 15,
          ),

          // PromotionCards Widget
          const PromotionCards()
        ],
      ),
    );
  }
}
