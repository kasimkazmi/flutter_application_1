import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/background_shape.dart';
import 'package:flutter_application_1/base/widgets/gradient_circle_button.dart';
import 'package:get/get.dart';

import '../../base/utils/app_routes.dart';
import '../../base/widgets/input_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                GradientCircleButton(onPressed: () {}),
              ],
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
