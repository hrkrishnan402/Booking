import 'package:bookingapp/api/response/model/city.dart';
import 'package:bookingapp/core/constant/palette.dart';
import 'package:bookingapp/presentation/blocs/hotel_list/listhotels_bloc.dart';
import 'package:bookingapp/presentation/blocs/search_city/search_city_bloc.dart';
import 'package:bookingapp/presentation/pages/hotel_list/widgets/hotel_list.dart';
import 'package:bookingapp/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelListPage extends StatelessWidget {
  final String? keyword;
  City? city;
  HotelListPage({Key? key, this.keyword = "", this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          HeaderWidget(),
          Stack(
            children: [
              Container(
                height: 300,
                color: Palette.teritiary,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 120),
                color: Palette.onPrimary,
                child: BlocBuilder<SearchCityBloc, SearchCityState>(
                  builder: (context, serachCityState) {
                    return BlocBuilder<ListhotelsBloc, ListhotelsState>(
                      builder: (context, state) {
                        if (serachCityState is SearchCitySuccessState) {
                          return HotelListWidget(
                            initDataBloc: () {
                              BlocProvider.of<ListhotelsBloc>(context).add(
                                  GetHotelListEvent(
                                      city: city ??
                                          (serachCityState.searchCityResponse
                                                  .cities!.isNotEmpty
                                              ? serachCityState
                                                  .searchCityResponse.cities![0]
                                              : null),
                                      keyword: city == null
                                          ? serachCityState
                                              .searchCityResponse.cities![0].id
                                              .toString()
                                          : keyword as String));
                            },
                          );
                        }
                        return const SizedBox(
                          child: Text("Loading"),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
