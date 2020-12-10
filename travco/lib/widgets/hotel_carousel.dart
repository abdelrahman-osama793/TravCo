import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travco/models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
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
                "Exclusive Hotels",
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
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                //The container which contains image and text containers
                margin: EdgeInsets.all(10.0),
                width: 240.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      child: Container(
                        //The container which contains the text
                        height: 150.0,
                        width: 240.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                hotel.name,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                hotel.address,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                "\$${hotel.price}/night",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
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
                      child: ClipRRect(
                        //added this ClipRRect to control the border radius of the image itself
                        child: Opacity(
                          opacity: 0.9,
                          child: Image(
                            image: AssetImage(hotel.imageUrl),
                            height: 180.0,
                            width: 220.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
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
