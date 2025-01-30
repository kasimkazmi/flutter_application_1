import 'package:flutter/material.dart';

class TravelPackageCards extends StatelessWidget {
  final Map<String, dynamic> travelPackage;

  const TravelPackageCards({required this.travelPackage, super.key});

  @override
  Widget build(BuildContext context) {
    final destination = travelPackage["destination"];
    final package = travelPackage["package"];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Extract values from the package and destination data
    final destinationType = destination["destination"] ?? 'Unknown';
    final rating = package["rating"] ?? 0;
    final discount =
        package["discounts"]?.join(", ") ?? 'No discount available';
    final packageDescription =
        package["description"] ?? 'No description available';
    final image = package["image"] ?? 'assets/no_image.png';

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: SizedBox(
          height: screenHeight * 0.4,
          width: screenWidth * 0.8,
          child: AspectRatio(
            aspectRatio: 0.75,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Destination type
                        Text(
                          "Destination: $destinationType",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Rating
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.orange, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              "$rating/5",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Discounts (if any)
                        Text(
                          "Discount: $discount",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Package description
                        Text(
                          packageDescription,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
