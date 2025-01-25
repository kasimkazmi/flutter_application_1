import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/bottom_navbar.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/screens/Register/register_screen.dart';
import 'package:flutter_application_1/screens/home/all_hotels.dart';
import 'package:flutter_application_1/screens/home/all_tickets_screen.dart';
import 'package:flutter_application_1/screens/features/hotel/hotel_detail.dart';
import 'package:flutter_application_1/screens/login/forgot_screen.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/screens/profile/edit_profile.dart';
import 'package:flutter_application_1/screens/profile/widget/blog_details.dart';
import 'package:flutter_application_1/screens/splash/splash_screen.dart';
import 'package:flutter_application_1/screens/ticket/ticket_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'controller/user_controller.dart';

void main() async {


  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Set custom error handling widget
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Center(
        child: Container(
          color: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Something went wrong!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                details.exception.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  };

  // Initialize controllers lazily
  Get.lazyPut<AuthController>(() => AuthController());
  Get.lazyPut<UserController>(() => UserController());
  try {
    // Check if the .env file exists at the root directory
    final envFile = File('.env');
    if (await envFile.exists()) {
      print(".env file found, loading...");
      await dotenv.load(); // Ensure that the .env file is loaded first
    } else {
      print("Error: .env file not found.");
    }
  } catch (e) {
    print("Error loading .env file: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AuthController after it's initialized
    final AuthController authController = Get.find<AuthController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        // Check if the user is logged in and navigate accordingly
        return authController.isLoggedIn.value ? BottomNavBar() : LoginScreen();
      }),

      // Use named routes for navigation throughout the app
      routes: {
        AppRoutes.homePage: (context) => BottomNavBar(),
        AppRoutes.allTickets: (context) => AllTickets(),
        AppRoutes.ticketScreen: (context) => TicketScreen(),
        AppRoutes.allHotelScreen: (context) => AllHotels(),
        AppRoutes.hotelDetail: (context) => HotelDetail(),
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.registerScreen: (context) => RegisterScreen(),
        AppRoutes.editScreen: (context) => EditProfile(),
        AppRoutes.forgotPasswordScreen: (context) => ForgotPasswordScreen(),
        AppRoutes.splashScreen: (context) => SplashScreen(),
        AppRoutes.blogDetails: (context) => BlogDetails(),
      },
    );
  }
}
