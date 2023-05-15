import 'dart:convert';

import 'package:bookingapp/api/request/base_request.dart';
import 'package:bookingapp/api/request/bookroom_request.dart';
import 'package:bookingapp/api/request/hotel_details_request.dart';
import 'package:bookingapp/api/request/login_request.dart';
import 'package:bookingapp/api/request/search_city_request.dart';
import 'package:bookingapp/api/request/signup_request.dart';
import 'package:bookingapp/api/response/booking_response.dart';
import 'package:bookingapp/api/response/hotel_details_response.dart';
import 'package:bookingapp/api/response/login_response.dart';
import 'package:bookingapp/api/response/search_city_response.dart';
import 'package:bookingapp/api/response/signup_response.dart';
import 'package:bookingapp/api/services/interface/iquery_resource_service.dart';
import 'package:bookingapp/api/services/interface/iuser_resource_service.dart';
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
  final LocalStorageService _localStorageService =
      GetIt.I.get<LocalStorageService>();
  IQueryResourceService _queryResourceService =
      GetIt.I.get<IQueryResourceService>();
  final IUserResourceService _userResourceService =
      GetIt.I.get<IUserResourceService>();
  ApiBridge();

  setApiResources(IQueryResourceService iQueryResourceService) {
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
    HotelDetailsRequest hotelDetailsRequest = HotelDetailsRequest(
        hotelId: hotelId,
        adults: 1,
        children: 0,
        count: 1,
        fromDate: "",
        toDate: "");
    await _addBaseRequestValues(hotelDetailsRequest);
    return _queryResourceService.fetchHotelDetails(hotelDetailsRequest);
  }

  Future<SignupResponse> signup(
      String customerName, String phone, String password, String dob) async {
    SignupRequest signupRequest = SignupRequest(
        dob: dob, name: customerName, password: password, phone: phone);
    await _addBaseRequestValues(signupRequest);
    return _userResourceService.signup(signupRequest);
  }

  Future<LoginResponse> login(String phone, String password) async {
    LoginRequest loginRequest = LoginRequest(password: password, phone: phone);
    await _addBaseRequestValues(loginRequest);
    LoginResponse loginResponse =
        await _userResourceService.login(loginRequest);
    await _localStorageService.setItem("jwt", loginResponse.jwt.toString());
    return loginResponse;
  }

  Future<BookRoomResponse> bookRoom(int roomId, String date) async {
    BookroomRequest bookroomRequest =
        BookroomRequest(roomId: roomId, date: date);
    await _addBaseRequestValues(bookroomRequest);
    return await _userResourceService.bookRoom(bookroomRequest);
  }

  /// This methods Sets the Required BaseRequest Fields
  /// Return Future<void>
  Future<void> _addBaseRequestValues(BaseRequest request) async {
    //do something here
  }
}
