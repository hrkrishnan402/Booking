import 'package:bookingapp/api/response/export.dart';

class HotelListResponse {
  List<Hotel>? hotels;
  HotelListResponse({required this.hotels});

   HotelListResponse.fromJson(List<dynamic> json) {
      hotels = <Hotel>[];
      // ignore: avoid_function_literals_in_foreach_calls
      json.forEach((v) {
        hotels!.add(Hotel.fromJson(v));
      });
  }
}