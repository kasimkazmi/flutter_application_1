import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/text_column_layout.dart';
import 'package:flutter_application_1/base/widgets/text_style_Forth.dart';
import 'package:flutter_application_1/base/widgets/text_style_third.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          const Padding(padding: EdgeInsets.only(top: 40)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Avatar
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(AppMedia.logo))),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Book Ticket",
                    style: AppStyles.headLineStyle2,
                  ),
                  Text(
                    "New York",
                    style: AppStyles.greetingsLabel.copyWith(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                    decoration: BoxDecoration(
                        color: AppStyles.profileLocationBG,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppStyles.profileStatusTextColor,
                          ),
                          child: const Icon(
                            FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Premium Status",
                          style: TextStyle(
                              color: AppStyles.profileStatusTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Text(
                "Edit",
                style: AppStyles.greetingsLabel
                    .copyWith(color: AppStyles.primaryColor),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(18)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: AppStyles.ticketBGColor,
                      child: const Icon(
                        FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                        size: 27,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextStyleForth(
                          text: "You've got new award",
                          isColor: null,
                        ),
                        Text(
                          "You have 96 flights in a year",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.45)),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
          //   Divider
        ],
      ),
    );
  }
}
