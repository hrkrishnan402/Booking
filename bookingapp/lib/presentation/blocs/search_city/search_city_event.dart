part of 'search_city_bloc.dart';

@immutable
abstract class SearchCityEvent {}


class SearchCityKeywordEvent extends SearchCityEvent {
  final String keyword;
  SearchCityKeywordEvent({required this.keyword});
}