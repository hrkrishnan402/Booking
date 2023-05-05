import 'package:bookingapp/api/request/hotel_details_request.dart';
import 'package:bookingapp/api/request/search_city_request.dart';
import 'package:bookingapp/api/response/hotel_details_response.dart';
import 'package:bookingapp/api/response/search_city_response.dart';

import '../../request/list_hotels.dart';
import '../../response/hotel_list.response.dart';

abstract class IQueryResourceService {
  Future<SearchCityResponse> fetchCities(SearchCityRequest searchCityRequest);
  Future<HotelListResponse> fetchHotelList(ListHotelRequest searchCityRequest);
  Future<HotelDetailsResponse> fetchHotelDetails(HotelDetailsRequest hotelDetailsRequest);
}