import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/router/route_constants.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).about),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: _drawerList(),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
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
                  children: [
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
                    Text(translation(context)
                        .c_r_t_w_a_d_o_t_g_s_a_w_a_t_f_a_t_s),
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
      ),
    );
  }

  Container _drawerList() {
    // ignore: no_leading_underscores_for_local_identifiers
    TextStyle _textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 15,
    );
    // ignore: avoid_unnecessary_containers
    return Container(
      // color: selected ? Colors.grey[300] : Colors.transparent,
      // color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 90,
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Text(
                        translation(context).menu,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    )
                  ],
                )
                // Text(translation(context).menu)
                ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).home,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to Home Page
              Navigator.pushNamed(context, homeRoute);
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(
          //     Icons.receipt_long_outlined,
          //     color: Colors.red,
          //     size: 20,
          //   ),
          //   title: Text(
          //     translation(context).view_rec,
          //     style: _textStyle,
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, viewallRoute);
          //   },
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.g_translate_outlined,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).language,
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, languageRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.lock_reset_outlined,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).chg_pass,
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, changpassRout);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).about,
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
        ],
      ),
    );
  }
}
