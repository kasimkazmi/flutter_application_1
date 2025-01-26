import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/background_shape.dart';
import 'package:flutter_application_1/base/widgets/gradient_circle_button.dart';
import 'package:get/get.dart';

import '../../base/utils/app_routes.dart';
import '../../controller/auth_service.dart';
import '../../controller/validation_controller.dart';

class RegisterScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final ValidationController validationController = ValidationController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundShape(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: AppStyles.greetingsLabel
                        .copyWith(fontSize: 45, letterSpacing: 2),
                  ),
                  const SizedBox(height: 40),
                  // Email Login
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: validationController.validateUsername,
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: validationController.validateEmail,
                  ),

                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: validationController.validatePassword,
                  ),

                  const SizedBox(height: 16),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,

                    validator: (value) =>
                        validationController.validateConfirmPassword(
                            value,
                            passwordController
                                .text), // Use a closure to pass both values
                  ),

                  const SizedBox(height: 16),
                  GradientCircleButton(onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Print the email and password for debugging
                      // print("Username: ${usernameController.text}");
                      // print("Email: ${emailController.text}");
                      // print("Password: ${passwordController.text}");

                      // Call the registerWithEmail method from AuthController
                      User? user = await _authService.registerWithEmail(
                        emailController.text,
                        passwordController.text,
                        usernameController.text,
                      );

                      if (user != null) {
                        // Register Successful, Navigate to Home Screen
                        Get.offAllNamed(AppRoutes.homePage);
                      } else {
                        // Check if context is still valid (mounted)
                        if (!context.mounted) {
                          return; // Early return if widget is disposed
                        }

                        //   Show error message if register failed
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Registration failed. Please try again"),
                          ),
                        );
                      }
                    }
                  }),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15, // 15% from the top
            right: 30,
            child: TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.loginScreen);
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  color: AppStyles.ticketBottomColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
