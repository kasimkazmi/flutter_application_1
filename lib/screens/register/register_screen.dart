import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/background_shape.dart';
import 'package:flutter_application_1/base/widgets/gradient_circle_button.dart';
import 'package:get/get.dart';

import '../../base/utils/app_routes.dart';
import '../../base/widgets/input_text.dart';
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
                  InputText(
                    label: "Username ",
                    controller: usernameController,
                    prefixIcon: null,
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    label: "Email ",
                    controller: emailController,
                    prefixIcon: null,
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    label: "Password ",
                    controller: passwordController,
                    prefixIcon: null,
                  ),
                  const SizedBox(height: 16),
                  InputText(
                    label: "Confirm Password",
                    controller: confirmPasswordController,
                    prefixIcon: null,
                  ),
                  const SizedBox(height: 16),
                  GradientCircleButton(onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Print the email and password for debugging
                      print("Username: ${usernameController.text}");
                      print("Email: ${emailController.text}");
                      print("Password: ${passwordController.text}");

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
