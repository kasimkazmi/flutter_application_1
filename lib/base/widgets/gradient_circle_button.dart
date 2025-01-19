// Replace ButtonElevated with this new widget inside the LoginScreen code
import 'package:flutter/material.dart';

class GradientCircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientCircleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle, // Circular shape
        gradient: LinearGradient(
          colors: [Color(0xFFF9945D), Color(0xFF20D5FE)], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // Shadow color
            offset: Offset(0, 4), // Shadow position
            blurRadius: 10, // Shadow blur
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_forward), // Forward arrow icon
        color: Colors.white, // Icon color
        iconSize: 30, // Icon size
      ),
    );
  }
}
