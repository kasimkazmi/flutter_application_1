import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/utils/hotel_list.dart';
import 'package:flutter_application_1/base/utils/ticket_json.dart';
import 'package:flutter_application_1/base/widgets/ticket_view.dart';
import 'package:flutter_application_1/screens/home/widgets/hotel.dart';

import '../../base/res/styles/app_styles.dart';
import '../../base/utils/app_routes.dart';
import '../../base/widgets/app_section_headingText.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Colum
    //ListView
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        //Scrollable effect
        body: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Greetings !", style: AppStyles.greetingsLabel),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Book Tickets ",
                              style: AppStyles.headLineStyle2),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(AppMedia.logo))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6FD)),
                    child: Row(
                      children: [
                        Icon(FluentSystemIcons.ic_fluent_search_regular,
                            color: Color(0xFFBFC205)),
                        Text("Search "),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  AppSectionHeading(
                      leftText: "Upcoming Meetings",
                      rightText: "View All",
                      func: () =>
                          Navigator.pushNamed(context, AppRoutes.allTickets)),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ticketList
                            .map((singleTicket) => GestureDetector(
                                onTap: () {
                                  var index = ticketList.indexOf(singleTicket);
                                  print("aosm =====>$index");
                                  Navigator.pushNamed(
                                      context, AppRoutes.ticketScreen,
                                      arguments: {"index": index});
                                },
                                child: TicketView(
                                  ticket: singleTicket,
                                )))
                            .toList(), // Convert Iterable to List<Widget>
                      )),
                  const SizedBox(height: 40),

                  // View All Button
                  AppSectionHeading(
                      leftText: "Hotels",
                      rightText: "View All",
                      func: () => Navigator.pushNamed(
                          context, AppRoutes.allHotelScreen)),

                  // Hotel Card View
                  const SizedBox(height: 25),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: hotelList
                            .map((hotelItem) => GestureDetector(
                                  onTap: () {
                                    var index = hotelList.indexOf(hotelItem);
                                    print("aosm =====>$index");
                                    Navigator.pushNamed(
                                        context, AppRoutes.hotelDetail,
                                        arguments: {"index": index});
                                  },
                                  child: HotelCard(
                                    hotel: hotelItem,
                                  ),
                                ))
                            .toList(),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
