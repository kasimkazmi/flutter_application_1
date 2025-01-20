import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class HotelCard extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelCard({super.key, required this.hotel});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: size.width * 0.6,
      height: 350,
      decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(hotel["image"]))),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(hotel["placeType"],
              style: AppStyles.headLineStyle2
                  .copyWith(color: AppStyles.hotelKhakiColor)),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(hotel["destination"],
              style: AppStyles.headLineStyle2
                  .copyWith(color: Colors.white, fontSize: 20)),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text("\$25/Night",
              style: AppStyles.greetingsLabel
                  .copyWith(color: AppStyles.hotelKhakiColor)),
        ),
      ]),
    );
  }
}
