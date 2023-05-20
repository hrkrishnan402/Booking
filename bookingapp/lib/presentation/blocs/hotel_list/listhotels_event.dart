part of 'listhotels_bloc.dart';

@immutable
abstract class ListhotelsEvent {}


class GetHotelListEvent extends ListhotelsEvent {
  final String keyword;
  final City? city;
  GetHotelListEvent({required this.keyword,required this.city});
}