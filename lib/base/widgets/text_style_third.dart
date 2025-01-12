import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class TextStyleThird extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final  bool? isColor;
  const TextStyleThird(
      {super.key, required this.text, this.textAlign = TextAlign.start, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppStyles.textStyle.copyWith(color: isColor==null ?Colors.white: Colors.blueGrey, fontSize: 16),
    );
  }
}
