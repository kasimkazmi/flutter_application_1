import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(
      {super.key,
      required this.label,
      this.obscureText = false,
      required this.controller,
      required this.prefixIcon});
  final String label;
  final bool obscureText;
  final IconData? prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon)
              : null, // only add icon if it's not null
          labelText: label,
          labelStyle:
              TextStyle(color: Colors.black45, fontWeight: FontWeight.w600),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
              )),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
    );
  }
}
