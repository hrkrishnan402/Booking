// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookingapp/api/api_exception.dart';
import 'package:bookingapp/api/response/model/city.dart';
import 'package:bookingapp/api/response/search_city_response.dart';
import 'package:bookingapp/core/api_bridge.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
part 'search_city_event.dart';
part 'search_city_state.dart';

class SearchCityBloc extends Bloc<SearchCityEvent, SearchCityState> {
  final ApiBridge apiBridge = GetIt.I.get<ApiBridge>();
  SearchCityBloc() : super(SearchCityInitial()) {
    on<SearchCityEvent>((event, emit) {});
    on<SearchCityKeywordEvent>(
      (event, emit) async {
        try {
          emit(SearchCityLoadingState());
          SearchCityResponse searchCityResponse =
              await apiBridge.fetchCities(event.keyword);
          if (searchCityResponse.cities!.isNotEmpty && event.city == null) {
            emit(SearchCitySuccessState(
                searchCityResponse: searchCityResponse,
                selectedCity: searchCityResponse.cities![0]));
          }
        } on ApiException catch (e) {
          emit(
              SearchCityFailedState(statusCode: e.code, message: e.toString()));
        }
      },
    );
    on<SelectCityKeywordEvent>(
      (event, emit) async {
        try {
          SearchCitySuccessState searchCitySuccessState =
              state as SearchCitySuccessState;
          emit(SearchCitySuccessState(
              searchCityResponse: searchCitySuccessState.searchCityResponse,
              selectedCity: event.city as City));
        } on ApiException catch (e) {
          emit(
              SearchCityFailedState(statusCode: e.code, message: e.toString()));
        }
      },
    );
  }
}

  // on<SelectCityKeywordEvent>(event, emit) async {
  //     SearchCityResponse searchCityResponse =
  //         await apiBridge.fetchCities(event.keyword);
      // emit(SearchCitySuccessState(
      //     searchCityResponse: searchCityResponse,
      //     selectedCity: event.city as City));
  //   }