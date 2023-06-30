import 'package:bookingapp/presentation/blocs/search_city/search_city_bloc.dart';
import 'package:bookingapp/presentation/pages/home/widgets/android_app_widget.dart';
import 'package:bookingapp/presentation/pages/home/widgets/book_now_widget.dart';
import 'package:bookingapp/presentation/pages/home/widgets/hotel_booking_opennow_widget.dart';
import 'package:bookingapp/presentation/pages/home/widgets/popular_cities_widget.dart';
import 'package:bookingapp/presentation/widgets/footer_widget.dart';
import 'package:bookingapp/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchCityBloc>(context)
        .add(SearchCityKeywordEvent(city: null, keyword: ""));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          HeaderWidget(),
          const BookNowWidget(),
          const HotelBookingOpenNowWidget(),
          const PopularCitiesWidget(),
          const AndroidAppWidget(),
          const FooterWidget(),
        ]),
      ),
    );
  }
}
