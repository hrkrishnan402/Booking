import 'package:bookingapp/api/response/hotel_details_response.dart';
import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class ImageSlideShow extends StatefulWidget {
  final HotelDetailsResponse hotelDetailsResponse;
  ImageSlideShow({Key? key , required this.hotelDetailsResponse}) : super(key: key);

  @override
  State<ImageSlideShow> createState() => _ImageSlideShowState();
}

class _ImageSlideShowState extends State<ImageSlideShow> {


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(
              widget.hotelDetailsResponse.displayImages![0],
            ))),
        child: Stack(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_new))),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios))),
        ]),
      ),
      const SizedBox(
        height: 10.0,
      ),
      SizedBox(
        height: 50,
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children:  widget.hotelDetailsResponse.displayImages!
                .map((e) => Container(
                      color: Palette.teritiary,
                      margin: const EdgeInsets.only(right: 10.0),
                      height: 50,
                      width: 80,
                      child: Image.network(e, fit: BoxFit.cover),
                    ))
                .toList(),
          ),
        ),
      )
    ]);
  }
}
