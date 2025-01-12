import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/ticket_json.dart';
import 'package:flutter_application_1/base/widgets/app_layoutbuiller_widget.dart';
import 'package:flutter_application_1/base/widgets/text_column_layout.dart';
import 'package:flutter_application_1/base/widgets/ticket_view.dart';
import 'package:flutter_application_1/screens/search/widgets/tap_bar.dart';
import 'package:flutter_application_1/screens/ticket/widgets/rounded_selector.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Now you can safely access ModalRoute after initState is complete
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    print("object=>>>>>>>,$args");
    if (args != null && args.containsKey("index")) {
      ticketIndex = args["index"];
    } else {
      ticketIndex = 0; // Default index if no argument is passed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: const Text(" Tickets")),
      ),
      backgroundColor: AppStyles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            children: [
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
                    ticket: ticketList[ticketIndex],
                    isColor: true,
                  )),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                                  scale: 8,
                                ),
                                Text(" *** 51658")
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Payment method",
                              style: AppStyles.textStyle.copyWith(
                                  color: Colors.blueGrey, fontSize: 16),
                            )
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
                  ticket: ticketList[ticketIndex],
                ),
              )
            ],
          ),
          RoundedSelector(
            position: true,
          ),
          RoundedSelector(
            position: false,
          )
        ],
      ),
    );
  }
}
