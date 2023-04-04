class City {
    City({
        required this.displayName,
        required this.id,
        required this.type,
    });

    String displayName;
    int id;
    String type;

    factory City.fromJson(Map<String, dynamic> json) => City(
        displayName: json["displayName"],
        id: json["id"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "id": id,
        "type": type,
    };
}