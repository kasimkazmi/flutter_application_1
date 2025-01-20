import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';

import '../../base/utils/hotel_list.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        backgroundColor: AppStyles.bgColor,
        title: Text("All Hotels"),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16.0),
            itemCount: hotelList.length,
            itemBuilder: (context, index) {
              var hotelItem = hotelList[index];
              return HotelGrid(hotel: hotelItem, index: index);
            },
          ),
        ),
      ),
    );
  }
}

class HotelGrid extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;
  const HotelGrid({super.key, required this.hotel, required this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("$index+++");
        Navigator.pushNamed(
          context,
          AppRoutes.hotelDetail,
          arguments: {"id": hotel["id"]},
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
            color: AppStyles.textColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: Container(
              decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(hotel["image"]))),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(hotel["placeType"],
                style: AppStyles.greetingsLabel
                    .copyWith(color: AppStyles.hotelKhakiColor)),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(hotel["destination"],
                      style: AppStyles.textStyle
                          .copyWith(color: Colors.white, fontSize: 20)),
                ),
                SizedBox(
                  width: 4,
                ),
                Center(
                  child: Text("\$25/Night",
                      style: AppStyles.textStyle
                          .copyWith(color: AppStyles.hotelKhakiColor)),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
