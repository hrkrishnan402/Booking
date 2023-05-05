part of 'listhotels_bloc.dart';

@immutable
abstract class ListhotelsEvent {}


class GetHotelListEvent extends ListhotelsEvent {
  final String keyword;
  GetHotelListEvent({required this.keyword});
}