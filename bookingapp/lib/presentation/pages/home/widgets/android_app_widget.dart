import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class AndroidAppWidget extends StatelessWidget {
  const AndroidAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 222, 216, 216),
      padding: EdgeInsets.only(
          top: 80,
          bottom: 80,
          left: MediaQuery.of(context).size.width / 8,
          right: MediaQuery.of(context).size.width / 8),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(flex: 3, child: Placeholder()),
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Have you tried our mobile app?",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "World leading Hotel Booking Website,Over 30,000 Hotel rooms worldwide.Book Hotel room and enjoy your holidays with\ndistinctive experience",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
                      "Easy Hotel Booking",
                      "Easy Hotel Booking",
                      "Easy Hotel Booking",
                      "Easy Hotel Booking"
                    ]
                        .map((e) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.domain_verification_sharp , color: Colors.blue,),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(e,style: Theme.of(context).textTheme.subtitle1,)
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(children: [
                          const Icon(
                            Icons.play_arrow_sharp,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          Column(
                            children: [
                              Text(
                                "Android app on",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "Google play",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        ]),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(children: [
                          const Icon(
                            Icons.play_arrow_sharp,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          Column(
                            children: [
                              Text(
                                "Download on the",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                "App Store",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        ]),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
    );
  }
}
