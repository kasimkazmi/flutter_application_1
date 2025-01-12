import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.func,
  });

  final String leftText;
  final String rightText;
  final VoidCallback func; // Corrected type

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: AppStyles.sectionHeadingLeft,
        ),
        InkWell(
          onTap: func, // Use the func parameter
          child: Text(
            rightText,
            style: AppStyles.textStyle.copyWith(color: AppStyles.primaryColor),
          ),
        ),
      ],
    );
  }
}