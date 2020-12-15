import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travco/models/destination_model.dart';
import 'package:travco/view/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Destinations",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "See All",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //The main container which contains all things
          height: 300.0,
          child: ListView.builder(
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Get.to(
                  DestinationScreen(
                    destination: destination,
                  ),
                ),
                child: Container(
                  //The container which contains image and text containers
                  margin: EdgeInsets.all(10.0),
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        child: Container(
                          //The container which contains the text
                          height: 150.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${destination.activities.length} activities",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  destination.description,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        bottom: 15.0,
                      ),
                      Container(
                        //The container which contains the image
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ]),
                        child: Stack(
                          children: [
                            Hero(
                              tag: destination.imageUrl,
                              child: ClipRRect(
                                //added this ClipRRect to control the border radius image itself
                                child: Opacity(
                                  opacity: 0.9,
                                  child: Image(
                                    image: AssetImage(destination.imageUrl),
                                    height: 180.0,
                                    width: 180.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    destination.city,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
