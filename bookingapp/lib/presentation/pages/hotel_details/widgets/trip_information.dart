import 'package:flutter/material.dart';

class TripInformation extends StatelessWidget {
  const TripInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> tripInformation = [
      'Paris trip', // Destination
      'Monday departure', // Departure
      'Friday arrival', // Arrival
      '7-day duration', // Duration
      '500 price', // Price
      'Hilton hotel', // Hotel
      'King room', // Room type
    ];

    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: const [
            
                Text(
                  'Trip Informations',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tripInformation.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.check_circle , color: Colors.blue,),
                title: Text(tripInformation[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
