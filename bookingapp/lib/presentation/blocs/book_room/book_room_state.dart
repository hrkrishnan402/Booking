part of 'book_room_bloc.dart';

@immutable
abstract class BookRoomState {}

class BookRoomInitial extends BookRoomState {}

class BookroomSuccessState extends BookRoomState {
  final BookRoomResponse bookRoomResponse;
  BookroomSuccessState({required this.bookRoomResponse});
}

class BookroomLoadingState extends BookRoomState {}

class BookroomFailedState extends BookRoomState {
  final int statusCode;
  final String message;
  BookroomFailedState({required this.statusCode, required this.message});
}
