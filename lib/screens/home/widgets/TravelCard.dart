import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';

class TravelCardList extends StatelessWidget {
  final Map<String, dynamic> data;
  TravelCardList({super.key, required this.data}) {
    print("Travel=====>$data");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Horizontal scroll
      child: Row(
        children: List.generate(
          data["destinations"].length, // Loop through all destinations
          (index) {
            var destination =
                data["destinations"][index]; // Current destination
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TravelCard(destination: destination),
            );
          },
        ),
      ),
    );
  }
}

class TravelCard extends StatelessWidget {
  final Map<String, dynamic> destination;

  const TravelCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        MediaQuery.of(context).size.width * 0.7; // 70% of screen width

    return Container(
      width: cardWidth, // Adjust width of the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Destination name
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              destination["destination"] ??
                  'Unknown Location', // Destination name
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Packages for the current destination
          Expanded(
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(Colors.blue), // Corrected
                radius: Radius.circular(10),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.vertical, // Vertical scroll for packages
                  child: Column(
                    children: List.generate(
                      destination["packages"].length, // Loop through packages
                      (packageIndex) {
                        var package = destination["packages"][packageIndex];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: TravelPackageCard(package: package),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TravelPackageCard extends StatelessWidget {
  final Map<String, dynamic> package;

  const TravelPackageCard({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    double cardWidth =
        MediaQuery.of(context).size.width * 0.7; // 70% of screen width

    return Container(
      width: cardWidth, // Adjust width of the package card
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage(package["image"] ??
                        AppMedia.noImages), // Fallback image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    package["duration"] ?? 'N/A', // Fallback value
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () {
                    // Handle bookmark action
                  },
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Row(
                  children: (package["discounts"] as List<String>? ?? [])
                      .map<Widget>((discount) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          discount,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          // Details section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "${package["rating"] ?? 'N/A'} (${package["reviews"] ?? '0'})", // Fallback values
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconInfo(Icons.flight,
                        package["flights"] ?? 'N/A'), // Fallback value
                    _buildIconInfo(Icons.hotel,
                        package["hotel"] ?? 'N/A'), // Fallback value
                    _buildIconInfo(Icons.directions_car,
                        package["transfers"] ?? 'N/A'), // Fallback value
                  ],
                ),
                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    text: "\$${package["price"] ?? '0'}", // Fallback value
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    children: const [
                      TextSpan(
                        text: " Per Person",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  package["description"] ??
                      'No description available', // Fallback value
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.blueAccent),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
