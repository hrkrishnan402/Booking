part of 'hotel_details_bloc.dart';

@immutable
abstract class HotelDetailsState {}

class HotelDetailsInitial extends HotelDetailsState {}

class HotelDetailsSuccessState extends HotelDetailsState {
  final HotelDetailsResponse hotelDetailsResponse;
  HotelDetailsSuccessState({required this.hotelDetailsResponse});
}

class HotelDetailsLoadingState extends HotelDetailsState {}

class HotelDetailsFailedState extends HotelDetailsState {
  final int statusCode;
  final String message;
  HotelDetailsFailedState({required this.statusCode , required this.message});
}
