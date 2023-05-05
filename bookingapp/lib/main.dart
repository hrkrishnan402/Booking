import 'package:bookingapp/core/dependency.dart';
import 'package:bookingapp/presentation/blocs/hotel_details/hotel_details_bloc.dart';
import 'package:bookingapp/presentation/blocs/hotel_list/listhotels_bloc.dart';
import 'package:bookingapp/presentation/blocs/search_city/search_city_bloc.dart';
import 'package:bookingapp/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchCityBloc()),
        BlocProvider(create: (context) => ListhotelsBloc()),
        BlocProvider(create: (context) => HotelDetailsBloc()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return _buildErrorPage();
          };
          return (widget as Widget);
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute<void>(
              settings: settings,
              builder: (BuildContext context) {
                return _buildErrorPage();
              });
        },
        title: 'Borrowing App',
        theme: ThemeData(
          errorColor: Colors.redAccent,
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.white,
        ),
        routes: routes,
      ),
    );
  }

  Widget _buildErrorPage() {
    return const Scaffold(
      body: Center(child: Text("Error")),
    );
  }
}
