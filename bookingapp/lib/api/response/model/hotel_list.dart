class Hotel {
  Hotel({
    required this.hotelId,
    required this.hotelName,
    required this.currentPrice,
    required this.availableRooms,
    required this.available,
  });

  int hotelId;
  String hotelName;
  int currentPrice;
  int availableRooms;
  bool available;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        hotelId: json["hotelId"],
        hotelName: json["hotelName"],
        currentPrice: json["currentPrice"],
        availableRooms: json["availableRooms"],
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "hotelName": hotelName,
        "currentPrice": currentPrice,
        "availableRooms": availableRooms,
        "available": available,
      };
}
