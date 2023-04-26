class Hotel {
  Hotel({
    required this.hotelist,
  });

  List<Hotelist> hotelist;

  factory Hotel.fromJson(List<dynamic> json) => Hotel(
        hotelist: List<Hotelist>.from(json.map((x) => Hotelist.fromJson(x))),
      );
}

class Hotelist {
  Hotelist({
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

  factory Hotelist.fromJson(Map<String, dynamic> json) => Hotelist(
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
