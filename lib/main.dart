import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/bottom_navbar.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/screens/Register/register_screen.dart';
import 'package:flutter_application_1/screens/home/all_hotels.dart';
import 'package:flutter_application_1/screens/home/all_tickets_screen.dart';
import 'package:flutter_application_1/screens/hotel_detail.dart';
import 'package:flutter_application_1/screens/login/login_screen.dart';
import 'package:flutter_application_1/screens/profile/edit_profile.dart';
import 'package:flutter_application_1/screens/splash/splash_screen.dart';
import 'package:flutter_application_1/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Initialize AuthController and UserController lazily
  Get.lazyPut<AuthController>(() => AuthController());
  Get.lazyPut<UserController>(() => UserController());

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
        // Show splash screen while loading auth state
        return authController.isLoggedIn.value ? BottomNavBar() : LoginScreen();
      }),

      // Use AuthWrapper to manage authentication state
      routes: {
        AppRoutes.homePage: (context) => BottomNavBar(),
        AppRoutes.allTickets: (context) => AllTickets(),
        AppRoutes.ticketScreen: (context) => TicketScreen(),
        AppRoutes.allHotelScreen: (context) => AllHotels(),
        AppRoutes.hotelDetail: (context) => HotelDetail(),
        AppRoutes.loginScreen: (context) => LoginScreen(),
        AppRoutes.registerScreen: (context) => RegisterScreen(),
        AppRoutes.editScreen: (context) => EditProfile(),
        AppRoutes.splashScreen: (context) => SplashScreen(),
      },
    );
  }
}
