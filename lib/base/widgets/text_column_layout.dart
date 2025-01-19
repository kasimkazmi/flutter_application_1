import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/base/widgets/text_style_forth.dart';
import 'package:flutter_application_1/base/widgets/text_style_third.dart';

class TextColumnLayout extends StatelessWidget {
  final String topText;
  final String bottomText;
  final CrossAxisAlignment crossAxisAlignment;
  final bool? isColor;
  const TextColumnLayout(
      {super.key,
      required this.topText,
      required this.bottomText,
      required this.crossAxisAlignment,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        TextStyleForth(
          text: topText,
          isColor: isColor,
        ),
        const SizedBox(
          height: 5,
        ),
        TextStyleThird(
          text: bottomText,
          isColor: isColor,
        )
      ],
    );
  }
}
