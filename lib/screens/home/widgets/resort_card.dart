import 'package:flutter/material.dart';

class ResortCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const ResortCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
      child: Row(
        children: [
          // Image Section
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              data["image"], // Access image from data
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          // Details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Resort Name
                  Text(
                    data["name"], // Access name from data
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 14, color: Colors.red),
                      const SizedBox(width: 4),
                      Text(
                        data["location"], // Access location from data
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Reviews Section
                  Row(
                    children: [
                      // Profile Avatars
                      Stack(
                        children: List.generate(
                          data["avatars"].length,
                          (index) => Positioned(
                            left: index * 16.0,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage:
                                  AssetImage(data["avatars"][index]),
                            ),
                          ),
                        )..add(
                            Positioned(
                              left: data["avatars"].length * 16.0,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.red,
                                child: Text(
                                  "${data["extraReviews"]}+",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ),
                      const SizedBox(width: 60),
                      // Review Count
                      Text(
                        "${data["reviews"]} reviews", // Access reviews from data
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
