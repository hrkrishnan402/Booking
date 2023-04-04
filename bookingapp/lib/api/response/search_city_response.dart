import 'package:bookingapp/api/response/model/city.dart';

class SearchCityResponse {
  List<City>? cities;
  SearchCityResponse({required this.cities});

   SearchCityResponse.fromJson(List<dynamic> json) {
      cities = <City>[];
      // ignore: avoid_function_literals_in_foreach_calls
      json.forEach((v) {
        cities!.add(City.fromJson(v));
      });
  }
}