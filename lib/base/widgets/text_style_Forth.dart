import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class TextStyleForth extends StatelessWidget {
  final String text;

  const TextStyleForth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.textStyle.copyWith(color: Colors.white, fontSize: 18),
    );
  }
}
