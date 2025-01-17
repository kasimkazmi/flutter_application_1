import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/bottom_navbar.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/screens/Register/register_screen.dart';
import 'package:flutter_application_1/screens/home/all_hotels.dart';
import 'package:flutter_application_1/screens/home/all_tickets_screen.dart';
import 'package:flutter_application_1/screens/hotel_detail.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(), // Use AuthWrapper to manage authentication state
      routes: {
        AppRoutes.homePage: (context) => BottomNavBar(), // Home route
        AppRoutes.allTickets: (context) =>
            const AllTickets(), // All tickets route
        AppRoutes.ticketScreen: (context) =>
            const TicketScreen(), // Single ticket route
        AppRoutes.allHotelScreen: (context) =>
            const AllHotels(), // All Hotels route
        AppRoutes.hotelDetail: (context) =>
            const HotelDetail(), // Hotel Detail route
        AppRoutes.loginScreen: (context) => LoginScreen(), // Login route
        AppRoutes.registerScreen: (context) =>
            RegisterScreen(), // Register route
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            // User is not logged in, show login screen
            return LoginScreen();
          } else {
            // User is logged in, show home screen
            return BottomNavBar();
          }
        } else {
          // While waiting for the connection, show a loading indicator
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
