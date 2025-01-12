import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';
import 'package:flutter_application_1/base/utils/ticket_json.dart';
import 'package:flutter_application_1/base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: const Text("All Tickets")),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList.isNotEmpty
                  ? ticketList.map((singleTicket) {
                      return GestureDetector(
                        onTap: () {
                          var index = ticketList.indexOf(singleTicket);
                          Navigator.pushNamed(context, AppRoutes.ticketScreen,
                              arguments: {"index": index});
                          // print("Ticket list  ===> $singleTicket, $index");
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: TicketView(ticket: singleTicket),
                        ),
                      );
                    }).toList()
                  : [Text("No tickets available")], // Fallback UI
            ),
          ),
        ],
      ),
    );
  }
}
