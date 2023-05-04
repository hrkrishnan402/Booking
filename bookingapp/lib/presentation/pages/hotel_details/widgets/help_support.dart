import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            padding: const EdgeInsets.only(left: 20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'HELP & SUPPORT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(height: 15),
                  Text(
                    'Call us Now',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.redAccent,
                        ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.blue,
                        size: 30,
                      ),
                      Text(
                        '+1 123-456-7890',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
