import 'package:bookingapp/presentation/pages/home/home_page.dart';
import 'package:bookingapp/presentation/pages/hotel_list/hotel_list_page.dart';

var routes = {
  "/": (context) => const HomePage(),
  "hotels": (context) => const HotelListPage(),
  "hotel-details": (context) => const HotelListPage(),
};
