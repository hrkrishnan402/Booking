import 'package:bookingapp/api/response/model/city.dart';
import 'package:bookingapp/core/constant/palette.dart';
import 'package:bookingapp/presentation/blocs/hotel_list/listhotels_bloc.dart';
import 'package:bookingapp/presentation/blocs/login/login_bloc.dart';
import 'package:bookingapp/presentation/blocs/search_city/search_city_bloc.dart';
import 'package:bookingapp/presentation/pages/auth/auth_page.dart';
import 'package:bookingapp/presentation/pages/hotel_list/hotel_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    Key? key,
  }) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Image.network(
            //     'https://example.com/image.jpg',

            //     fit: BoxFit.cover,
            //   ),
            // ),
            Column(
              children: [
                _buildSiginSignUpnavbar(context),
                _buildMenuNavBar(context),
              ],
            )
          ],
        ),
        _buildSearchnavBar(context),
      ],
    );
  }

  Container _buildSearchnavBar(BuildContext context) {
    return Container(
      color: Palette.HEADER_SEARCH_COLOR,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 1, child: _buildCityDropdownSearchBar()),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        flex: 2,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search Over a million tour and travels',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Palette.buttonBackground),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 26.0), // set the horizontal padding
                          ),
                        ),
                        onPressed: () {
                          //      BlocProvider.of<ListhotelsBloc>(context)
                          // .add(GetHotelListEvent(keyword: "207"));
                        },
                        child: const Text("SEARCH"))
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityDropdownSearchBar() {
    return BlocBuilder<SearchCityBloc, SearchCityState>(
      builder: (context, state) {
        return SizedBox(
          child: Autocomplete(
            initialValue: state is SearchCitySuccessState
                ? TextEditingValue(text: state.selectedCity.displayName)
                : const TextEditingValue(text: ""),
            optionsViewBuilder: (BuildContext context,
                AutocompleteOnSelected<City> onSelected,
                Iterable<City> options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    height: state is SearchCitySuccessState &&
                            state.searchCityResponse.cities!.isNotEmpty
                        ? state.searchCityResponse.cities!.length * 30
                        : 100,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: options.map((City option) {
                          return ListTile(
                            title: Text(option.displayName),
                            onTap: () {
                              onSelected(option);
                            },
                          );
                        }),
                      ).toList(),
                    ),
                  ),
                ),
              );
            },
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<City>.empty();
              } else {
                List<City> matches = <City>[];
                if ((state is SearchCitySuccessState &&
                    state.searchCityResponse.cities!.isNotEmpty)) {
                  for (var e in state.searchCityResponse.cities!) {
                    matches.add(City(
                        displayName: e.displayName, id: e.id, type: e.type));
                  }
                } else if (state is SearchCitySuccessState &&
                    state.searchCityResponse.cities!.isEmpty) {
                  matches.add(
                      City(displayName: "No Results Found", id: 0, type: ""));
                }
                return matches;
              }
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                onChanged: (value) {
                  BlocProvider.of<SearchCityBloc>(context)
                      .add(SearchCityKeywordEvent(keyword: value));
                },
                onFieldSubmitted: (String value) {
                  // onFieldSubmitted();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: state is SearchCitySuccessState
                      ? state.selectedCity.displayName
                      : 'Enter city',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              );
            },
            onSelected: (selection) {
              Logger().w(selection);
              BlocProvider.of<SearchCityBloc>(context).add(
                  SelectCityKeywordEvent(
                      city: selection, keyword: selection.id.toString()));
              BlocProvider.of<ListhotelsBloc>(context).add(GetHotelListEvent(
                  city: selection, keyword: selection.id.toString()));
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HotelListPage(
                  city: selection,
                  keyword: selection.id.toString(),
                );
              }));
            },
          ),
        );
      },
    );
  }

  Container _buildMenuNavBar(BuildContext context) {
    return Container(
      color: Palette.HEADER_MENU_COLOR,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8 - 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                      child: Text(
                        "Home",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.black),
                      )),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("Packages",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black))),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "hotels");
                      },
                      child: Text("Hotels",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black))),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("Profile",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black))),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text("Contact us",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black))),
                ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSiginSignUpnavbar(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccessState) {
          return SizedBox(
            height: 30,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Palette.HEADER_SIGNIN_BTN_COLOR),
                        elevation: MaterialStateProperty.all<double>(0.0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                0.0), // set the border radius
                          ),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                      },
                      child: const Text("Logout")),
                ],
              ),
            ),
          );
        }
        return Container(
          color: Palette.HEADER_AUTH_COLOR,
          height: 30,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.HEADER_SIGNIN_BTN_COLOR),
                    elevation: MaterialStateProperty.all<double>(0.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0.0), // set the border radius
                      ),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: AuthPage(
                                    index: 1,
                                  )));
                        });
                  },
                  child: const Text("Sign In")),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.HEADER_SIGNUP_BTN_COLOR),
                    elevation: MaterialStateProperty.all<double>(0.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0.0), // set the border radius
                      ),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: AuthPage(
                                    index: 0,
                                  )));
                        });
                  },
                  child: const Text("Sign Up")),
            ]),
          ),
        );
      },
    );
  }
}
