import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSiginSignUpnavbar(context),
        _buildMenuNavBar(context),
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
                    Flexible(
                        flex: 1,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Enter city',
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
                    Flexible(
                        flex: 2,
                        child: TextField(
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
                        onPressed: () {},
                        child: const Text("SEARCH"))
                  ]),
            ),
          ],
        ),
      ),
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
                      onPressed: () {},
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
                      onPressed: () {},
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

  Container _buildSiginSignUpnavbar(BuildContext context) {
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
              onPressed: () {},
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
              onPressed: () {},
              child: const Text("Sign Up")),
        ]),
      ),
    );
  }
}
