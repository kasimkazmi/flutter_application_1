import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/bottom_navbar.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/screens/home/all_hotels.dart';
import 'package:flutter_application_1/screens/home/all_tickets_screen.dart';
import 'package:flutter_application_1/screens/hotel_detail.dart';
import 'package:flutter_application_1/screens/ticket/ticket_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage: (context) => BottomNavBar(), // Home route
        AppRoutes.allTickets: (context) =>
            const AllTickets(), // All tickets route
        AppRoutes.ticketScreen: (context) =>
            const TicketScreen(), //Single ticket route
        AppRoutes.allHotelScreen: (context) =>
            const AllHotels(), //All Hotels  route
        AppRoutes.hotelDetail: (context) =>
            const HotelDetail(), //Hotel Detail  route
      },
    );
  }
}
