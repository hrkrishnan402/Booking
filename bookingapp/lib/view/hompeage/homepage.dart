import 'package:bookingapp/model/export.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<City> cities = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3.0),
            borderRadius: const BorderRadius.all(
                Radius.circular(5.0) //                 <--- border radius here
                ),
          ),
          child: TextField(
            onChanged: (value) {
              searchCities(value);
            },
            decoration: const InputDecoration(
              labelText: "Search Your Location...",
              suffix: Icon(Icons.location_city),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
      body: cities.isEmpty
          ? const Center(
              child: Text('No Cities Found'),
            )
          : Column(
              children: cities.map((City e) => Text(e.displayName)).toList(),
            ),
    );
  }

  Future<void> searchCities(String query) async {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://bookingappcore-env.eba-xmeutmkw.ap-south-1.elasticbeanstalk.com/search?keyword=$query');

    List queryResponse = response.data;

    setState(() {
      cities = queryResponse.map((e) => City.fromJson(e)).toList();
    });
  }
}
