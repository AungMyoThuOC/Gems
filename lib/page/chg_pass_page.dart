import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/page/Login/login_page.dart';
import 'package:gems_records/router/route_constants.dart';
import 'package:page_transition/page_transition.dart';

// ignore: camel_case_types
class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Change_PasswordState createState() => _Change_PasswordState();
}

// ignore: camel_case_types
class _Change_PasswordState extends State<Change_Password> {
  TextEditingController chgpassCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).chg_pass),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: _drawerList(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: chgpassCon,
              decoration: const InputDecoration(
                labelText: "password",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const LoginAccountPage(),
                  ));
                  setState(() {
                    
                  });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  translation(context).save,
                ),
              ),
            ),
          )
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   // ignore: sized_box_for_whitespace
          //   child: Container(
          //     width: double.infinity,
          //     height: 30,
          //     child:
          //         ElevatedButton(
          //           onPressed: () {},
          //           child: Text(
          //             // "Save",
          //             translation(context).save,
          //             )
          //         ),
          //   ),
          // )
        ],
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
          // ListTile(
          //   leading: const Icon(
          //     Icons.lock_reset_outlined,
          //     color: Colors.red,
          //     size: 20,
          //   ),
          //   title: Text(
          //     translation(context).chg_pass,
          //     style: _textStyle,
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, changpassRout);
          //   },
          // ),
          // const Divider(),
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
