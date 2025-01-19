import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/base/widgets/gradient_circle_button.dart';
import 'package:flutter_application_1/screens/login/forgot_screen.dart';
import 'package:get/get.dart';
import '../../base/widgets/background_shape.dart';
import '../../controller/auth_service.dart';
import '../../controller/soical_login_controller.dart';
import '../../controller/validation_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthService _authService = AuthService();
  final ValidationController validationController = ValidationController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SocialLoginController socialLoginController = SocialLoginController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: Stack(
        children: [
          // Background Curves
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundShape(),
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: AppStyles.greetingsLabel
                                  .copyWith(fontSize: 45, letterSpacing: 2),
                            ),
                            const SizedBox(height: 48),
                            // Email Login
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: validationController.validateEmail,
                            ),
                            const SizedBox(height: 16),
                            // Password Input
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

                            // ElevatedButton(
                            //   onPressed: () async {
                            //     if (_formKey.currentState!.validate()) {
                            //       User? user =
                            //           await _authService.signInWithEmail(
                            //         emailController.text,
                            //         passwordController.text,
                            //       );
                            //       if (user != null) {
                            //         // Navigate to home screen
                            //         Get.offAllNamed(AppRoutes.homePage);
                            //       }
                            //     } else {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(
                            //             content: Text(
                            //                 'Login failed. Please check your credentials.')),
                            //       );
                            //     }
                            //   },
                            //   child: Text("Login with Email"),
                            // ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GradientCircleButton(
                                  // Proceed with login
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      User? user =
                                          await _authService.signInWithEmail(
                                        emailController.text,
                                        passwordController.text,
                                      );
                                      if (user != null) {
                                        // Navigate to home screen
                                        Get.offAllNamed(AppRoutes.homePage);
                                      } else {
                                        // Check if context is still valid (mounted)
                                        if (!context.mounted) {
                                          return; // Early return if widget is disposed
                                        }
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Login failed. Please check your credentials.')),
                                        );
                                      }
                                    }
                                  },
                                ),

                                // ElevatedButton(

                                TextButton(
                                  onPressed: () {
                                    // Handle forgot password action
                                    Get.to(ForgotPasswordScreen());
                                  },
                                  child: const Text(
                                    'Forgot ?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.registerScreen);
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppStyles.ticketBottomColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Google Sign-In Button
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color(0xFF4285F4), // Google Blue
                                    foregroundColor: Colors.white, // Text Color
                                  ),
                                  onPressed: () async {
                                    User? user = await socialLoginController
                                        .signInWithGoogle();
                                    if (user != null) {
                                      // Handle successful login
                                    }
                                  },
                                  child: Text("Sign in with Google"),
                                ),
                                // Facebook Sign-In Button
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color(0xFF3B5998), // Facebook Blue
                                    foregroundColor: Colors.white, // Text Color
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      User? user = await socialLoginController
                                          .signInWithFacebook();
                                      if (user != null) {
                                        // Navigate to home screen
                                        Get.offAllNamed(AppRoutes.homePage);
                                      } else {
                                        // Check if context is still valid (mounted)
                                        if (!context.mounted)
                                          return; // Early return if widget is disposed

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Login failed with Facebook. Please check your credentials.')),
                                        );
                                      }
                                    }
                                  },
                                  child: Text("Sign in with Facebook"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
