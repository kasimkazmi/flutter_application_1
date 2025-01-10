import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/base/widgets/text_style_third.dart';

class TextColumnLayout extends StatelessWidget {
  final String topText ;
  final String bottomText;
  final CrossAxisAlignment crossAxisAlignment;

  const TextColumnLayout({super.key, required this.topText, required this.bottomText, required this.crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        TextStyleThird(text: topText),
        const SizedBox(height: 5,),
        TextStyleThird(text: bottomText)
      ],
    );
  }
}
