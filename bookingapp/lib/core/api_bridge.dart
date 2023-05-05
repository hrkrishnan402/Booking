import 'dart:convert';

import 'package:bookingapp/api/request/base_request.dart';
import 'package:bookingapp/api/request/hotel_details_request.dart';
import 'package:bookingapp/api/request/search_city_request.dart';
import 'package:bookingapp/api/response/hotel_details_response.dart';
import 'package:bookingapp/api/response/search_city_response.dart';
import 'package:bookingapp/api/services/interface/iquery_resource_service.dart';
import 'package:bookingapp/core/platform/local_storage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../api/request/list_hotels.dart';
import '../api/response/hotel_list.response.dart';

/// This class Provides Common Interface for [CommandResourceApi]
/// , [QueryResourceApi] , [UserResourceApi] and some extra methods
/// This class may become too large to maintain in the future
/// so split it feature wise when needed
class ApiBridge {
  final logger = Logger();
  final LocalStorageService _localStorageService = GetIt.I.get<LocalStorageService>();
  IQueryResourceService _queryResourceService = GetIt.I.get<IQueryResourceService>();
  ApiBridge();

  setApiResources(IQueryResourceService iQueryResourceService){
    _queryResourceService = iQueryResourceService;
  }

  /// Fetch List of Cities Based on Keyword
  /// Return Future<SearchCityResponse>
  Future<SearchCityResponse> fetchCities(String keyword) async {
    SearchCityRequest searchCityRequest = SearchCityRequest(keyword: keyword);
    await _addBaseRequestValues(searchCityRequest);
    return _queryResourceService.fetchCities(searchCityRequest);
  }

  Future<HotelListResponse> fetchHotelList(String keyword) async {
    ListHotelRequest searchCityRequest = ListHotelRequest(keyword: keyword);
    await _addBaseRequestValues(searchCityRequest);
    return _queryResourceService.fetchHotelList(searchCityRequest);
  }

 Future<HotelDetailsResponse> fetchHotelDetails(int hotelId) async {
    HotelDetailsRequest hotelDetailsRequest = HotelDetailsRequest(hotelId: hotelId, adults: 1,
    
    children: 0,count: 1,fromDate: "",toDate: "");
    await _addBaseRequestValues(hotelDetailsRequest);
    return _queryResourceService.fetchHotelDetails(hotelDetailsRequest);
  }


  /// This methods Sets the Required BaseRequest Fields
  /// Return Future<void>
  Future<void> _addBaseRequestValues(BaseRequest request) async {
    //do something here
  }

}
