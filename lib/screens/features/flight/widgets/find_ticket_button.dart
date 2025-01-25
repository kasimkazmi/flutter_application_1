import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class AppButton extends StatelessWidget {
  final String label;

  const AppButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xD91130CE),
      ),
      child: Center(
        child: Text(
          label,
          style: AppStyles.textStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
