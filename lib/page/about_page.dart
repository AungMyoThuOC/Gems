import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
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
              // const Text("What includes :"),
              Text(translation(context).w_i),
              const SizedBox(
                height: 15,
              ),
              Column(
                children:  [
                  // Text("-  Can save 8 photos of each gem stone."),
                  Text(translation(context).c_s_8_p_o_e_g_s),
                  const SizedBox(
                    height: 10,
                  ),
                  // const Text(
                  //     "-  Can record the name and the phone number\n  of seller."),
                  Text(translation(context).c_r_t_n_a_t_p_n_o_s),
                  const SizedBox(
                    height: 10,
                  ),
                  // const Text(
                  //     "-  Can record type, weight, accepted date of the\n   gem stone as well as the facts about\n  that stone."),
                  Text(translation(context).c_r_t_w_a_d_o_t_g_s_a_w_a_t_f_a_t_s),
                  const SizedBox(
                    height: 10,
                  ),
                  // const Text(
                  //     "-  Can search for recorded gem stones with date,\n   seller's name and gem stone's type."),
                  Text(translation(context).c_s_f_r_g_s_w_d_s_n_a_g_s_t),
                  const SizedBox(
                    height: 10,
                  ),
                  // const Text("-  Can edit delete the recorded gem stones.")
                  Text(translation(context).c_e_a_d_t_r_g_s)
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
