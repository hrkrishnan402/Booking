part of 'search_city_bloc.dart';

@immutable
abstract class SearchCityEvent {}


class SearchCityKeywordEvent extends SearchCityEvent {
  final String keyword;
 City? city;
  SearchCityKeywordEvent({required this.keyword ,  this.city });
}

class SelectCityKeywordEvent extends SearchCityEvent {
  final String keyword;
 City? city;
  SelectCityKeywordEvent({required this.keyword ,  this.city });
}
