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
                                offset: Offset(2.0, 2.3),
                                blurRadius: 10.0,
                                color: AppStyles.primaryColor)
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
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer tincidunt urna rhoncus aliquam molestie. Donec dictum dolor diam, facilisis sodales felis aliquet sollicitudin. Aenean ac dui enim. Proin luctus, sapien eu dignissim sollicitudin, diam dolor egestas velit, quis rhoncus augue dui ac leo. Sed rutrum nibh nec mauris lobortis, et faucibus turpis tristique. Ut suscipit tincidunt tristique. In ac laoreet lacus, non consectetur turpis. Nunc volutpat lectus eget aliquam facilisis. Proin accumsan elit in commodo dapibus. In ac sem aliquam, eleifend risus in, sagittis lectus. Ut lectus nulla, faucibus et iaculis fermentum, interdum ac velit. Aliquam non laoreet mi. Integer facilisis felis nulla, a dictum mi volutpat id. Ut sed mi pellentesque, faucibus ligula ut, malesuada ipsu. Donec suscipit tortor a neque hendrerit, ac convallis mi tempus. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc vitae sagittis elit. Etiam tristique est et sapien fermentum, eu sollicitudin tortor varius. Nullam pharetra cursus quam sit amet sagittis. Sed luctus at ante vestibulum sollicitudin. Duis luctus nulla eu dapibus mollis. Sed efficitur leo nec est egestas, aliquet gravida leo lacinia. In tortor tortor, vestibulum egestas metus et, mollis efficitur sem. Ut accumsan sapien eget molestie accumsan.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean euismod ullamcorper nisl, eget sodales sem. Curabitur nec dignissim magna, sed consectetur nisl. In auctor varius pretium. Duis feugiat lacinia eros, sed consectetur neque ultrices sit amet. Aenean finibus euismod lobortis. Ut turpis sem, placerat in cursus ut, porttitor a ligula. In euismod rhoncus dolor, et commodo sapien gravida eu."),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "More Text",
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.all(16),
                        child: Image.network("https://fakeimg.pl/200x200"));
                  }),
            )
          ]))
        ],
      ),
    );
  }
}
