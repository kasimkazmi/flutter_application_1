import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/utils/ticket_json.dart';
import 'package:flutter_application_1/base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("All Tickets")),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList.isNotEmpty
                  ? ticketList.map((singleTicket) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: TicketView(ticket: singleTicket),
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
