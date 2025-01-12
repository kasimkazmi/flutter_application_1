import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class BigCircle extends StatelessWidget {
  final bool isRight;

  const BigCircle({super.key, required this.isRight, this.isColor});

  final bool? isColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 20,
        width: 10,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: isColor == null ? Colors.white : AppStyles.bgColor,
                borderRadius: isRight == true
                    ? BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))
                    : BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)))));
  }
}
