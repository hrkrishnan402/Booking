import 'package:bookingapp/presentation/pages/home/home_page.dart';
import 'package:bookingapp/presentation/pages/hotel_details/hotel_details_page.dart';
import 'package:bookingapp/presentation/pages/hotel_list/hotel_list_page.dart';

var routes = {
  "/": (context) => const HomePage(),
  "hotels": (context) =>  HotelListPage(
    city: null,
  ),
  "hotel-details": (context) => const HotelDetailsPage(),
};
