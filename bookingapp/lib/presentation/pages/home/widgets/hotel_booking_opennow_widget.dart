import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelBookingOpenNowWidget extends StatelessWidget {
  const HotelBookingOpenNowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 160,
          bottom: 40,
          left: MediaQuery.of(context).size.width / 8,
          right: MediaQuery.of(context).size.width / 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                    text: "Hotels ",
                    children: [
                  TextSpan(
                      text: "Booking Open Now!",
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Palette.secondary))
                ])),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "World leading Hotel Booking Website,Over 30,000 Hotel rooms worldwide.Book Hotel room and enjoy your holidays with\ndistinctive experience",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 80,
          ),
          SizedBox(
            child: Row(
                children: [1, 2, 3]
                    .map((e) => Expanded(
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Stack(
                                  children:  [
                                    const ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(8.0)),
                                      child: Placeholder(
                                        fallbackHeight: 200,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 8.0,
                                      right: 8.0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.green[300]),
                                        child: const Text(
                                          'Available Tickets 42',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'GTC Grand Chola',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Loreipsum loreipsum loreipsum',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("Rating"),
                                                  RatingBar.builder(
                                                    initialRating: 3,
                                                    itemSize: 20.0,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 4.0),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      size: 5.0,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {},
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(
                                            "450",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                    color: Palette.secondary),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
