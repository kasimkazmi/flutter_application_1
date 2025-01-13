import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

import '../base/utils/hotel_list.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["index"]);
    index = args["index"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: CustomScrollView(
        slivers: [
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
                background: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                      fit: BoxFit.cover,
                      "${AppMedia.assetsPath}/${hotelList[index]["image"]}"),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
// Applying black color with 40% opacity
                      color: Colors.black.withValues(alpha: 0.45),
                      child: Text(
                          style: TextStyle(shadows: [
                            Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 10.0,
                                color: AppStyles.ticketBottomColor)
                          ], color: Colors.white, fontSize: 26),
                          hotelList[index]["placeType"])),
                )
              ],
            )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ExpandedText(
                text: hotelList[index]["detailsDescription"],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "More Images",
                style: TextStyle(
                    color: AppStyles.ticketTopColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelList[index]["images"].length,
                  itemBuilder: (context, imageIndex) {
                    return Container(
                      margin: EdgeInsets.all(16),
                      child: Image.asset(
                          "${AppMedia.assetsPath}/${hotelList[index]["images"][imageIndex]}"),
                    );
                  }),
            )
          ]))
        ],
      ),
    );
  }
}

class ExpandedText extends StatefulWidget {
  final String text;
  const ExpandedText({super.key, required this.text});

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool isExpanded = false;
  _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
    print("Value $isExpanded");
  }

  @override
  Widget build(BuildContext context) {
    var textWidget = Text(
      widget.text,
      maxLines: isExpanded ? null : 3,
      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget,
        GestureDetector(
          onTap: () {
            _toggleExpansion();
          },
          child: Text(
            isExpanded ? "Show Less" : "Show More",
            style: AppStyles.textStyle.copyWith(color: AppStyles.primaryColor),
          ),
        )
      ],
    );
  }
}
