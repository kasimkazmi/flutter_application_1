import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/app_layoutbuiller_widget.dart';
import 'package:flutter_application_1/base/widgets/big_ciricle.dart';
import 'package:flutter_application_1/base/widgets/big_dot.dart';
import 'package:flutter_application_1/base/widgets/text_column_layout.dart';
import 'package:flutter_application_1/base/widgets/text_style_Forth.dart';
import 'package:flutter_application_1/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const TicketView({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          children: [
            //Blue Top Part
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21)),
                  color: AppStyles.ticketTopColor),
              child: Column(
                children: [
                  // Show departure and destination with Icon
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleForth(text: ticket["from"]["code"]),
                      Expanded(child: Container()),
                      BigDot(),
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
                            child: const Icon(
                              Icons.local_airport_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ])),
                      BigDot(),
                      Expanded(child: Container()),
                      TextStyleForth(text: ticket["to"]["code"]),
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
                          child: TextStyleThird(text: ticket["from"]["name"])),
                      Expanded(child: Container()),
                      TextStyleThird(text: ticket["flying_time"]),
                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleThird(
                            text: ticket["to"]["name"],
                            textAlign: TextAlign.end,
                          ))
                    ],
                  )

                  // Show departure and destination with Icon
                ],
              ),
            ),

            // Bottom Part
            Container(
              color: AppStyles.ticketBottomColor,
              child: Row(
                children: [
                  const BigCircle(isRight: false),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                  )),
                  const BigCircle(
                    isRight: true,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(21),
                      bottomLeft: Radius.circular(21)),
                  color: AppStyles.ticketBottomColor),
              child: Column(
                children: [
                  // Show departure and destination with Icon

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextColumnLayout(
                        topText: ticket["date"],
                        bottomText: "Date",
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      TextColumnLayout(
                        topText: ticket["departure_time"],
                        bottomText: "Departure Time",
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      TextColumnLayout(
                        topText: ticket["gate_number"].toString(),
                        bottomText: "Number",
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
