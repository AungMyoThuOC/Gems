import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Gems Recore",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("What includes :"),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: const [
                  Text(
                    "-  Can save 8 photos of each gem stone."
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "-  Can record the name and the phone number\n  of seller."
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "-  Can record type, weight, accepted date of the\n   gem stone as well as the facts about\n  that stone."
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "-  Can search for recorded gem stones with date,\n   seller's name and gem stone's type."
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "-  Can edit delete the recorded gem stones."
                  )
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
