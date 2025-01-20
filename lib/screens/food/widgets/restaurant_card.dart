import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';

import '../../../base/utils/values/values.dart';
import 'card_tags.dart';

class RestaurantCard extends StatelessWidget {
  final String status;
  final String rating;
  final String imagePath;
  final String cardTitle;
  final String category;
  final String distance;
  final String address;
  final GestureTapCallback? onTap;
  final bool bookmark;
  final bool isThereStatus;
  final bool isThereRatings;
  final double tagRadius;
  final double width;
  final double cardHeight;
  final double imageHeight;
  final double cardElevation;
  final double ratingsAndStatusCardElevation;
  final List<String>? followersImagePath;

  const RestaurantCard({
    super.key,
    this.status = "OPEN",
    this.rating = "4.5",
    required this.imagePath,
    required this.cardTitle,
    required this.category,
    required this.distance,
    required this.address,
    this.width = 340.0,
    this.cardHeight = 280.0,
    this.imageHeight = 180.0,
    this.tagRadius = 8.0,
    this.onTap,
    this.isThereStatus = true,
    this.isThereRatings = true,
    this.bookmark = false,
    this.cardElevation = 4.0,
    this.ratingsAndStatusCardElevation = 8.0,
    this.followersImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: cardHeight,
        child: Card(
          elevation: cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        imagePath,
                        width: MediaQuery.of(context).size.width,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: Sizes.MARGIN_16,
                        vertical: Sizes.MARGIN_16,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                cardTitle,
                                textAlign: TextAlign.left,
                                style: Styles.customTitleTextStyle(
                                  color: AppColors.headingText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.TEXT_SIZE_20,
                                ),
                              ),
                              SizedBox(width: Sizes.WIDTH_4),
                              CardTags(
                                title: category,
                                decoration: BoxDecoration(
                                  gradient: Gradients.secondaryGradient,
                                  boxShadow: [
                                    Shadows.secondaryShadow,
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(tagRadius),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0),
                              CardTags(
                                title: distance,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 132, 141, 255),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(tagRadius)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  address,
                                  textAlign: TextAlign.left,
                                  style: Styles.customNormalTextStyle(
                                    color: AppColors.accentText,
                                    fontSize: Sizes.TEXT_SIZE_14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isThereStatus
                        ? Card(
                            elevation: ratingsAndStatusCardElevation,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.WIDTH_12,
                                  vertical: Sizes.HEIGHT_8),
                              child: Text(
                                status,
                                style: status.toLowerCase() ==
                                        StringConst.STATUS_OPEN.toLowerCase()
                                    ? Styles.customNormalTextStyle(
                                        color: AppColors.kFoodyBiteGreen,
                                        fontSize: Sizes.TEXT_SIZE_10,
                                        fontWeight: FontWeight.w700,
                                      )
                                    : Styles.customNormalTextStyle(
                                        color: Colors.red,
                                        fontSize: Sizes.TEXT_SIZE_10,
                                        fontWeight: FontWeight.w700,
                                      ),
                              ),
                            ),
                          )
                        : Container(),
                    isThereRatings
                        ? Card(
                            elevation: ratingsAndStatusCardElevation,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.WIDTH_8,
                                vertical: Sizes.WIDTH_4,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    AppMedia.starIcon,
                                    height: Sizes.WIDTH_14,
                                    width: Sizes.WIDTH_14,
                                  ),
                                  SizedBox(width: Sizes.WIDTH_4),
                                  Text(
                                    rating,
                                    style: Styles.customTitleTextStyle(
                                      color: AppColors.headingText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Sizes.TEXT_SIZE_14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              bookmark
                  ? Positioned(
                      top: (cardHeight / 2) + 16,
                      left: width - 70,
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Image.asset(AppMedia.activeBookmarksIcon2),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
