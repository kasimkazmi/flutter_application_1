import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/widgets/app_button.dart';
import '../../base/res/styles/app_styles.dart';
import '../../controller/auth_service.dart'; // Import your AuthService
import '../../controller/validation_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ValidationController validationController = ValidationController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  String? _message;

  // Method to send the password reset link
  void _sendResetLink(BuildContext context) async {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      String email = emailController.text; // Get the email from the controller
      try {
        // Call the AuthService to send the password reset email
        await AuthService().sendPasswordRestEmail(email);

        // Update the message to inform the user
        _message = 'A password reset link has been sent to $email';
      } catch (e) {
        // Handle any errors that occur during the process
        _message =
            'Error: ${e.toString()}'; // Update the message with the error
      }

      // Show a SnackBar with the message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_message ?? 'An unknown error occurred.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email input field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email), // Changed to email icon
                ),
                validator: validationController.validateEmail, // Validate email
              ),
              SizedBox(height: 16), // Space between fields
              // Button to send the reset link

              // Button to send the reset link
              AppButton(
                onPressed: () => _sendResetLink(
                    context), // Call the method to send the reset link
                label: 'Send Reset Link',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
