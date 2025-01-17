import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double elevation;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const ButtonElevated({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.purple,
    this.textColor = Colors.white,
    this.elevation = 5.0,
    this.borderRadius = 15.0,
    this.padding = const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color
        foregroundColor: textColor, // Text color
        elevation: elevation, // Shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
        ),
        padding: padding, // Padding
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
