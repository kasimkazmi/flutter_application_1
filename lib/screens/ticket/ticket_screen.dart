import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/ticket_json.dart';
import 'package:flutter_application_1/base/widgets/app_layoutbuiller_widget.dart';
import 'package:flutter_application_1/base/widgets/text_column_layout.dart';
import 'package:flutter_application_1/base/widgets/ticket_view.dart';
import 'package:flutter_application_1/screens/search/widgets/tap_bar.dart';

import '../../base/widgets/text_style_third.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "Ticket",
            style: AppStyles.headLineStyle2,
          ),
          const SizedBox(
            height: 20,
          ),
          TapBar(
            leftTab: "Upcoming",
            rightTab: "Previous",
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 16),
              child: TicketView(
                ticket: ticketList[0],
                isColor: true,
              )),
          const SizedBox(
            height: 2,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            color: AppStyles.ticketBGColor,
            child: Column(
              children: [
                // /
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextColumnLayout(
                      topText: "Flutter DB",
                      isColor: true,
                      bottomText: "Passenger",
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    TextColumnLayout(
                      topText: "541564185",
                      bottomText: "passport",
                      isColor: true,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const AppLayoutBuilderWidget(
                  randomDivider: 15,
                  width: 5,
                  isColor: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextColumnLayout(
                      topText: "565 44851 5155154 1",
                      isColor: true,
                      bottomText: "Ticket Number",
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    TextColumnLayout(
                      topText: "B123222",
                      bottomText: "Booking Code",
                      isColor: true,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const AppLayoutBuilderWidget(
                  randomDivider: 15,
                  width: 5,
                  isColor: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppMedia.visCard,
                              scale: 11,
                            ),
                            Text(
                              "*** 2465",
                              style: AppStyles.textStyle,
                            ),
                          ],
                        ),
                        const TextStyleThird(
                          text: ("Payment method"),
                          isColor: true,
                        ),
                      ],
                    ),
                    const TextColumnLayout(
                      topText: "\$254.99",
                      bottomText: "Price",
                      isColor: true,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // barcode
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: AppStyles.ticketBGColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21))),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BarcodeWidget(
                      height: 70,
                      data: "https://www.kasimkazmi.me",
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,
                      barcode: Barcode.code128())),
            ),
          ),
          //
          const SizedBox(
            height: 20,
          ),
          // Ticket bottom
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: TicketView(
              ticket: ticketList[0],
            ),
          )
        ],
      ),
    );
  }
}
