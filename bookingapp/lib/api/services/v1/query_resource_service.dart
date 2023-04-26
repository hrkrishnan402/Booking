import 'dart:convert';

import 'package:bookingapp/api/api_client.dart';
import 'package:bookingapp/api/api_config.dart';
import 'package:bookingapp/api/api_exception.dart';
import 'package:bookingapp/api/response/hoetl_list.response.dart';
import 'package:bookingapp/api/request/list_hotels.dart';
import 'package:bookingapp/api/response/search_city_response.dart';
import 'package:bookingapp/api/request/search_city_request.dart';
import 'package:bookingapp/api/services/interface/iquery_resource_service.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class QueryResourceService extends IQueryResourceService {
  ApiClient apiClient = ApiClient();
  final _log = Logger();
  QueryResourceService();

  @override
  Future<SearchCityResponse> fetchCities(
      SearchCityRequest searchCityRequest) async {
    final path =
        "${ApiConfig.appApiUrl}search?keyword=${searchCityRequest.keyword}";
    Response response = await apiClient.invokeAPI(path, 'GET',
        body: searchCityRequest,
        headerParams: {"Content-Type": "application/json"});
    _log.i("$path\n${searchCityRequest.toJson()}\n${response.body}");
    List<dynamic> responseList = json.decode(response.body);
    if (response.statusCode == 200) {
      return SearchCityResponse.fromJson(responseList);
    } else {
      throw ApiException(response.statusCode, "");
    }
  }

  @override
  Future<HotelListResponse> fetchHotelList(
      ListHotelRequest searchCityRequest) async {
    final path =
        "${ApiConfig.appApiUrl}hotels?city=${searchCityRequest.keyword}&page=0&required_rooms=0";
    Response response = await apiClient.invokeAPI(path, 'GET',
        body: searchCityRequest,
        headerParams: {"Content-Type": "application/json"});
    _log.i("$path\n${searchCityRequest.toJson()}\n${response.body}");
    var responseList = json.decode(response.body);
    if (response.statusCode == 200) {
      return HotelListResponse.fromJson(responseList);
    } else {
      throw ApiException(response.statusCode, "");
    }
  }
}
