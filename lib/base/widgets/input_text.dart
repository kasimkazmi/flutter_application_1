import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.label,
    this.obscureText = false,
    this.iconColor = const Color(0xFFBFC2DF),
    this.iconSize = 24.0,
    required this.prefixIcon,

    required this.controller,
    this.onTap, // Add onTap callback
  });

  final String label;
  final bool obscureText;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final Color iconColor;
  final double iconSize;
  final VoidCallback? onTap; // Callback for tap events

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger onTap when the field is tapped
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(
            prefixIcon,
            color: iconColor,
          )
              : null,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        ),
        onTap: onTap, // Call the onTap callback when the field is tapped
      ),
    );
  }
}