class HotelDetailsResponse {
  int? hotelId;
  String? hotelName;
  String? description;
  int? lat;
  int? lng;
  List<Rooms>? rooms;
  List<String>? displayImages;

  HotelDetailsResponse(
      {this.hotelId,
      this.hotelName,
      this.description,
      this.lat,
      this.lng,
      this.rooms,
      this.displayImages});

  HotelDetailsResponse.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    hotelName = json['hotelName'];
    description = json['description'];
    lat = json['lat'];
    lng = json['lng'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
    displayImages = json['displayImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelId'] = hotelId;
    data['hotelName'] = hotelName;
    data['description'] = description;
    data['lat'] = lat;
    data['lng'] = lng;
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    data['displayImages'] = displayImages;
    return data;
  }
}

class Rooms {
  int? roomId;
  String? roomTitle;
  String? description;
  int? mrp;
  int? currentPrice;
  String? roomType;
  int? roomSize;
  String? errorMessage;
  List<String>? displayImages;
  bool? available;

  Rooms(
      {this.roomId,
      this.roomTitle,
      this.description,
      this.mrp,
      this.currentPrice,
      this.roomType,
      this.roomSize,
      this.errorMessage,
      this.displayImages,
      this.available});

  Rooms.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    roomTitle = json['roomTitle'];
    description = json['description'];
    mrp = json['mrp'];
    currentPrice = json['currentPrice'];
    roomType = json['roomType'];
    roomSize = json['roomSize'];
    errorMessage = json['errorMessage'];
    displayImages = json['displayImages'].cast<String>();
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomId'] = roomId;
    data['roomTitle'] = roomTitle;
    data['description'] = description;
    data['mrp'] = mrp;
    data['currentPrice'] = currentPrice;
    data['roomType'] = roomType;
    data['roomSize'] = roomSize;
    data['errorMessage'] = errorMessage;
    data['displayImages'] = displayImages;
    data['available'] = available;
    return data;
  }
}
