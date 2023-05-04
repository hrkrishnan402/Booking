import 'package:bookingapp/core/constant/palette.dart';
import 'package:bookingapp/presentation/blocs/bloc/listhotels_bloc.dart';
import 'package:bookingapp/presentation/pages/hotel_details/widgets/help_support.dart';
import 'package:bookingapp/presentation/pages/hotel_details/widgets/hotel_ameinities.dart';
import 'package:bookingapp/presentation/pages/hotel_details/widgets/popular_packages.dart';
import 'package:bookingapp/presentation/pages/hotel_details/widgets/review_box.dart';
import 'package:bookingapp/presentation/pages/hotel_details/widgets/room_availability_list.dart';
import 'package:bookingapp/presentation/pages/hotel_details/widgets/special_features.dart';
import 'package:bookingapp/presentation/pages/hotel_details/widgets/trip_information.dart';
import 'package:bookingapp/presentation/widgets/header_widget.dart';
import 'package:bookingapp/presentation/widgets/image_slide_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, children: [
          HeaderWidget(),
          _buildHotelImageHeader(context),
          _buildHotelInfoNavBar(context),
          _buildHotelDetailsBodySection(context)
        ]),
      ),
    );
  }

  Container _buildHotelInfoNavBar(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 200),
      color: Palette.primary,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(color: Palette.teritiary))),
                child: Text(
                  "Location - Allepey",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Palette.onPrimary),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(color: Palette.teritiary))),
                child: Text(
                  "Price - \$300",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Palette.onPrimary),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(color: Palette.teritiary))),
                child: Text(
                  "Duration - One Night",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Palette.onPrimary),
                ),
              ),
            ),
            Expanded(
                child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Palette.secondary,
                    border: Border.symmetric(
                        vertical: BorderSide(color: Palette.teritiary))),
                child: Text(
                  "Book Now",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Palette.onSecondary),
                ),
              ),
            )),
          ]),
    );
  }

  Container _buildHotelImageHeader(BuildContext context) {
    return Container(
      height: 350,
      color: Palette.teritiary,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 200.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Universal Luxury Grand Hotel",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Palette.onPrimary),
                ),
                Text(
                    "CM4G+GWG, Lake Rd, Kasturibai Colony, West Mere, Ooty, Tamil Nadu 643004r",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Palette.onPrimary)),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Container _buildHotelDetailsBodySection(BuildContext context) {
    return Container(
      color: Palette.onSecondary,
      margin: const EdgeInsets.symmetric(horizontal: 140),
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Universal Luxury Grand Hotel",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 60,
              ),
              _buildSectionHeader("About GRAND HOTEL", context),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 20.0),
              ),
              const SizedBox(
                height: 60,
              ),
              _buildSectionHeader("Photo Gallery", context),
              const SizedBox(
                height: 40,
              ),
              ImageSlideShow(),
              const SizedBox(
                height: 60,
              ),
              _buildSectionHeader("Special features", context),
              const SizedBox(
                height: 40,
              ),
              const SpecialFeatures(),
              const SizedBox(
                height: 60,
              ),
              _buildSectionHeader("Room Availabilities", context),
              const SizedBox(
                height: 40,
              ),
              RoomAvailabilityList(initDataBloc: () {
                BlocProvider.of<ListhotelsBloc>(context)
                    .add(GetHotelListEvent(keyword: "207"));
              }),
              const SizedBox(
                height: 60,
              ),
              _buildSectionHeader("Hotel Amenieties", context),
              const SizedBox(
                height: 40,
              ),
              const HotelAmeinities(),
              const SizedBox(
                height: 40,
              ),
              Container(
                  height: 500,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: ReviewBox())
            ]),
          ),
          const SizedBox(width: 10.0,),
          Container(
            width: MediaQuery.of(context).size.width/5,
            margin: const EdgeInsets.only(top: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
              const TripInformation(),
              const HelpAndSupport(),
              PopularPackages()
            ],),
          )
        ],
      ),
    );
  }

  Row _buildSectionHeader(String text, BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.label,
          color: Colors.yellowAccent,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
