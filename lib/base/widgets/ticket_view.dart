import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/app_layoutbuiller_widget.dart';
import 'package:flutter_application_1/base/widgets/big_ciricle.dart';
import 'package:flutter_application_1/base/widgets/big_dot.dart';
import 'package:flutter_application_1/base/widgets/text_column_layout.dart';
import 'package:flutter_application_1/base/widgets/text_style_forth.dart';
import 'package:flutter_application_1/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 190,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            //Blue Top Part
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21)),
                  color: isColor == null
                      ? AppStyles.ticketTopColor
                      : Colors.white),
              child: Column(
                children: [
                  // Show departure and destination with Icon
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleForth(
                          text: ticket["from"]["code"], isColor: isColor),
                      Expanded(child: Container()),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(
                          child: Stack(children: [
                        const SizedBox(
                          height: 24,
                          child: AppLayoutBuilderWidget(
                            randomDivider: 6,
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: 1.57,
                            child: Icon(
                              Icons.local_airport_rounded,
                              color: isColor == null
                                  ? Colors.white
                                  : AppStyles.planIconColor,
                            ),
                          ),
                        )
                      ])),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      TextStyleForth(
                          text: ticket["to"]["code"], isColor: isColor),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 100,
                          child: TextStyleThird(
                            text: ticket["from"]["name"],
                            isColor: isColor,
                          )),
                      Expanded(child: Container()),
                      TextStyleThird(
                          text: ticket["flying_time"], isColor: isColor),
                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleThird(
                            text: ticket["to"]["name"],
                            isColor: isColor,
                            textAlign: TextAlign.end,
                          ))
                    ],
                  )

                  // Show departure and destination with Icon
                ],
              ),
            ),

            //Orange Bottom Part
            Container(
              color: isColor == null
                  ? AppStyles.ticketBottomColor
                  : AppStyles.ticketBGColor,
              child: Row(
                children: [
                  BigCircle(
                    isRight: false,
                    isColor: isColor,
                  ),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    isColor: isColor,
                    width: 6,
                  )),
                  BigCircle(
                    isRight: true,
                    isColor: isColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(isColor == null ? 21 : 0),
                    bottomLeft: Radius.circular(isColor == null ? 21 : 0)),
                color: isColor == null
                    ? AppStyles.ticketBottomColor
                    : AppStyles.ticketBGColor,
              ),
              child: Column(
                children: [
                  // Show departure and destination with Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextColumnLayout(
                        topText: ticket["date"],
                        isColor: isColor,
                        bottomText: "Date",
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      TextColumnLayout(
                        topText: ticket["departure_time"],
                        bottomText: "Departure Time",
                        isColor: isColor,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      TextColumnLayout(
                        topText: ticket["gate_number"].toString(),
                        bottomText: "Number",
                        isColor: isColor,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ],
                  )

                  // Show departure and destination with Icon
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
