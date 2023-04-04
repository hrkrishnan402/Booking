part of 'search_city_bloc.dart';

@immutable
abstract class SearchCityState {}

class SearchCityInitial extends SearchCityState {}

class SearchCitySuccessState extends SearchCityState{
  final SearchCityResponse searchCityResponse;
  SearchCitySuccessState({required this.searchCityResponse});
}

class SearchCityLoadingState extends SearchCityState {}

class SearchCityFailedState extends SearchCityState {
  final int statusCode;
  final String message;
  SearchCityFailedState({required this.statusCode , required this.message});
}