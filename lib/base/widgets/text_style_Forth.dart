import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class TextStyleForth extends StatelessWidget {
  final String text;

  const TextStyleForth({super.key, required this.text, this.isColor});
  final bool? isColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isColor == null
          ? AppStyles.textStyle.copyWith(color:  Colors.white, fontSize: 18)
          : AppStyles.textStyle.copyWith(color: AppStyles.textColor),
    );
  }
}
