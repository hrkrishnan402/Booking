import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class HotelBookingOpenNowWidget extends StatelessWidget {
  const HotelBookingOpenNowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 160, horizontal: MediaQuery.of(context).size.width / 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
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
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 2,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.0),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Text("hello"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
