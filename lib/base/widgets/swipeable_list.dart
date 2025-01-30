import 'package:flutter/material.dart';

class SwipeAbleList extends StatefulWidget {
  const SwipeAbleList({super.key});

  @override
  SwipeAbleListState createState() => SwipeAbleListState();
}

class SwipeAbleListState extends State<SwipeAbleList> {
  // List of items to display
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SwipeAble  Items")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            direction: DismissDirection.horizontal, // Allow horizontal swipe
            onDismissed: (direction) {
              setState(() {
                // Handle dismiss action
                if (direction == DismissDirection.endToStart) {
                  // Swiped left (archive item)
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${items[index]} archived")));
                } else if (direction == DismissDirection.startToEnd) {
                  // Swiped right (delete item)
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${items[index]} deleted")));
                }

                // Remove item from the list after dismissal
                items.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red, // Background color for swipe to delete
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(20), // Add padding around the icon
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.blue, // Background color for swipe to archive
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(20), // Add padding around the icon
                child: Icon(Icons.archive, color: Colors.white),
              ),
            ),
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
