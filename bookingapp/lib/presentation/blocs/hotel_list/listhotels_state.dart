part of 'listhotels_bloc.dart';

@immutable
abstract class ListhotelsState {}

class ListhotelsInitial extends ListhotelsState {}

class ListHotelsSuccessState extends ListhotelsState{
  final HotelListResponse listHotelsResponse;
  final City? city;
  ListHotelsSuccessState({required this.listHotelsResponse ,required this.city});
}

class ListHotelsLoadingState extends ListhotelsState {}

class ListHotelsFailedState extends ListhotelsState {
  final int statusCode;
  final String message;
  ListHotelsFailedState({required this.statusCode , required this.message});
}
