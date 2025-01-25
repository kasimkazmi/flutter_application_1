import 'package:flutter/material.dart';

class SelectFlight extends StatelessWidget {
  const SelectFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Pop the current screen
              Navigator.pop(context);
            }),
        title: Text('Select Flight'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Trip',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'AMS - DEL',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '12 Feb, 2020',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return FlightCard(
                    airline: index == 0
                        ? 'Spicejet'
                        : index == 1
                            ? 'IndiGo'
                            : index == 2
                                ? 'QATAR'
                                : 'Vistara',
                    price: index == 0
                        ? '\$283'
                        : index == 1
                            ? '\$447'
                            : index == 2
                                ? '\$591'
                                : '\$283',
                    departureTime: '8:00 pm',
                    departureLocation: 'AMS',
                    arrivalTime: '10:30 pm',
                    arrivalLocation: 'DEL',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  final String airline;
  final String price;
  final String departureTime;
  final String departureLocation;
  final String arrivalTime;
  final String arrivalLocation;

  const FlightCard({super.key,
    required this.airline,
    required this.price,
    required this.departureTime,
    required this.departureLocation,
    required this.arrivalTime,
    required this.arrivalLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  airline,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text('$departureTime - $arrivalTime'),
                Text('$departureLocation to $arrivalLocation'),
              ],
            ),
            Text(
              price,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
