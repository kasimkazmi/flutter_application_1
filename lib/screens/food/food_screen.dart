import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/hotel_list.dart';

import '../../base/utils/app_routes.dart';
import '../../base/widgets/app_section_heading.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<FoodScreen> {
  late TextEditingController
      searchController; // Controller for the search field
  List<String> searchResults = []; // List to hold search results

  @override
  void initState() {
    super.initState();
    searchController =
        TextEditingController(); // Initialize the search controller
  }

  @override
  void dispose() {
    searchController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        // Clear the search results if the query is empty
        searchResults = [];
      } else {
        // Perform the search and update the searchResults list
        searchResults = hotelList
            .where((hotel) =>
                hotel["destination"]
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                hotel["placeType"].toLowerCase().contains(query.toLowerCase()))
            .map<String>((hotel) => hotel["destination"])
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size.height; // Get the height of the screen

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for Search Bar
          SliverAppBar(
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppStyles.primaryColor),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(bottom: size * 0.055),
              background: Container(
                color: AppStyles.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Search Restaurant ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.white.withAlpha(25),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          _performSearch(
                              value); // Call search function on text change
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),

          // Conditionally Render Featured Hotels
          if (searchController.text.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AppSectionHeading(
                      leftText: "Featured Hotels",
                      rightText: "View All",
                      func: () {
                        print("View All clicked!");
                      },
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hotelList.length,
                        itemBuilder: (context, index) {
                          final hotel = hotelList[index];
                          return Container(
                            width: 150,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  hotel["destination"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  hotel["placeType"],
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(color: Colors.grey.shade300),
                  ],
                ),
              ),
            ),

          // Search Results Section
          if (searchResults.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final hotel = hotelList.firstWhere(
                    (h) => h["destination"] == searchResults[index],
                    orElse: () => {},
                  );

                  return Container(
                    height: 200, // Fixed height for the card
                    margin:
                        const EdgeInsets.all(8.0), // Add spacing between cards
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Background Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/images/${hotel["image"] ?? ""}",
                            fit: BoxFit.cover,
                            // image: AssetImage("assets/images/${hotel["image"]}"))),

                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),

                        // Overlay with gradient and content
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),

                        // Hotel Information
                        Positioned(
                          bottom: 20,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotel["destination"] ?? "Unknown",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                hotel["placeType"] ?? "Unknown",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to hotel detail page or perform another action
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.hotelDetail,
                                    arguments: {
                                      "id": hotel["id"]
                                    }, // Pass the correct data (id as int)
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text("View Details"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: searchResults.length,
              ),
            ),

          // Show "No Results Found" Only When Necessary
          if (searchResults.isEmpty && searchController.text.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
