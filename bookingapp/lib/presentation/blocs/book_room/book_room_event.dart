part of 'book_room_bloc.dart';

@immutable
abstract class BookRoomEvent {}

class FetchBookRoomEvent extends BookRoomEvent {
  final int roomId;
  final String date;
  FetchBookRoomEvent({required this.roomId, required this.date});
}
