import 'package:bookingapp/api/response/export.dart';
import 'package:bookingapp/api/response/model/city.dart';

class HotelListResponse {
  List<Hotel>? cities;
  HotelListResponse({required this.cities});

   HotelListResponse.fromJson(List<dynamic> json) {
      cities = <Hotel>[];
      // ignore: avoid_function_literals_in_foreach_calls
      json.forEach((v) {
        cities!.add(Hotel.fromJson(v));
      });
  }
}