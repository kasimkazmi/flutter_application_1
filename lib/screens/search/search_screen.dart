import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/app_section_headingText.dart';
import 'package:flutter_application_1/screens/search/widgets/find_ticket_button.dart';
import 'package:flutter_application_1/screens/search/widgets/promotion_cards.dart';
import 'package:flutter_application_1/screens/search/widgets/tap_bar.dart';
import 'package:flutter_application_1/screens/search/widgets/text_icon.dart';

import '../../base/utils/app_routes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "What are \n you looking for ?",
            style: AppStyles.headLineStyle2.copyWith(fontSize: 45),
          ),
          SizedBox(
            height: 20,
          ),
          const TapBar(
            leftTab: "All Airlines",
            rightTab: "Hotels",
          ),
          const SizedBox(height: 25),
          const TextIcon(
            icon: Icons.flight_takeoff_rounded,
            text: "Departure",
          ),
          const SizedBox(
            height: 20,
          ),
          const TextIcon(
            icon: Icons.flight_land_rounded,
            text: "Arrival",
          ),
          const SizedBox(
            height: 30,
          ),
          const FindTicketButton(),
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
