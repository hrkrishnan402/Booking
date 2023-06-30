import 'package:bookingapp/core/constant/palette.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 100.0),
      // height: MediaQuery.of(context).size.height / 1.8,
      color: Colors.black87,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(flex: 3, child: _buildFooterSectionOne(context)),
        const SizedBox(
          width: 40.0,
        ),
        Expanded(
          flex: 4,
          child: Container(
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Support and Help",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "About Us",
                                "Feedbacks",
                                "Option3",
                                "Option3",
                                "Option3",
                                "Option3",
                              ]
                                  .map((e) => Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(
                                          e,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  color: Palette
                                                      .FOOTER_TEXT_COLOR),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "About Us",
                                "Feedbacks",
                                "Option3",
                                "Option3"
                              ]
                                  .map((e) => Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(
                                          e,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  color: Palette
                                                      .FOOTER_TEXT_COLOR),
                                        ),
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                           padding: const EdgeInsets.only(left:12.0),
                          child: Text(
                            "Follow with us",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:12.0),
                          child: Text(
                            "World leading Hotel Booking Website,Over 30,000 Hotel rooms worldwide.Book Hotel room and enjoy your holidays with\ndistinctive experience",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  size: 40.0,
                                ),
                                color: Palette.FOOTER_TEXT_COLOR,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  size: 40.0,
                                ),
                                color: Palette.FOOTER_TEXT_COLOR,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  size: 40.0,
                                ),
                                color: Palette.FOOTER_TEXT_COLOR,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  size: 40.0,
                                ),
                                color: Palette.FOOTER_TEXT_COLOR,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.facebook,
                                  size: 40.0,
                                ),
                                color: Palette.FOOTER_TEXT_COLOR,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "MOST POPULAR STAYS",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Wrap(
                    spacing: 8.0, // Adjust the spacing between badges
                    runSpacing: 8.0, // Adjust the spacing between lines
                    children: [
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                      8,
                      9,
                      10,
                      11,
                      2,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1,
                      1
                    ]
                        .map(
                          (e) => Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            label: const Text('Badge 3'),
                            backgroundColor: Colors.grey,
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                        )
                        .toList(),
                  )
                ],
              )
            ]),
          ),
        ),
      ]),
    );
  }

  Container _buildFooterSectionOne(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Holiday Tours & Travels",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "World leading Hotel Booking Website,Over 30,000 Hotel rooms worldwide.Book Hotel room and enjoy your holidays with\ndistinctive experience",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Address & Contact Info",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "World leading Hotel Booking Website,Over 30,000 Hotel rooms worldwide.Book Hotel room and enjoy your holidays with\ndistinctive experience",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "PHONE: +8989289289",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Palette.FOOTER_TEXT_COLOR),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 90,
            ),
            Container(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.orange,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "30%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: Colors.yellow),
                                    children: [
                                  TextSpan(
                                    text: "off",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Palette.onPrimary),
                                  )
                                ])),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                    backgroundColor: Palette.secondary,
                                    foregroundColor: Palette.onSecondary),
                                onPressed: () {},
                                child: const Text("Book Now"))
                          ]),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.orange,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "30%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: Colors.yellow),
                                    children: [
                                  TextSpan(
                                    text: "off",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Palette.onPrimary),
                                  )
                                ])),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                    backgroundColor: Palette.secondary,
                                    foregroundColor: Palette.onSecondary),
                                onPressed: () {},
                                child: const Text("Book Now"))
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
