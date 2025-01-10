import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class TextStyleThird extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const TextStyleThird(
      {super.key, required this.text, this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppStyles.textStyle.copyWith(color: Colors.white, fontSize: 16),
    );
  }
}
