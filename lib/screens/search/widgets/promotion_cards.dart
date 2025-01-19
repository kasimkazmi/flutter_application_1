import 'package:flutter/material.dart';

import '../../../base/res/media.dart';
import '../../../base/res/styles/app_styles.dart';

class PromotionCards extends StatelessWidget {
  const PromotionCards({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 435,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: size.width * .42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.green.shade200,
                    blurRadius: 5,
                    spreadRadius: 10)
              ]),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppMedia.planInside)),
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  "20 % Discount on the early booking of this flight. Don't miss")
            ],
          ),
        ),
        SizedBox(
          height: 435,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    width: size.width * .45,
                    height: 210,
                    decoration: BoxDecoration(
                        color: const Color(0xFF3AB8B8),
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discount\nfor Survey",
                          style: AppStyles.headLineStyle2.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Take the Survey about our services and get discount",
                          style: AppStyles.headLineStyle2.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: -45,
                    top: -45,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 18, color: AppStyles.circleColor)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: size.width * 0.44,
                height: 210,
                decoration: BoxDecoration(
                    color: const Color(0xFFEC6545),
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Take Love",
                      style: AppStyles.headLineStyle2.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Take the Survey about our services and get discount",
                      style: AppStyles.headLineStyle2.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
