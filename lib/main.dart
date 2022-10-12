// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers

// import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/my_drawer_header.dart';
import 'package:gems_records/page/about_page.dart';
import 'package:gems_records/page/chg_pass_page.dart';
import 'package:gems_records/page/home_page.dart';
import 'package:gems_records/page/language.dart';
import 'package:gems_records/page/view_record_page.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
import 'firebase_options.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gems Records',
      // initialRoute: '/',
      // routes: {
      //   '/' :(context) =>  MainPage(),
      //   '/home' :(context) => const Home(),
      // },
      home: MainPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MainPage extends StatefulWidget {
  // const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // @override
  // void didChangeDependencies() {
  //   getLocale().then((locale) => {setLocale(locale)});
  //   super.didChangeDependencies();
  // }

  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSections.home) {
      container = const Home();
    } else if (currentPage == DrawerSections.view_all_records) {
      container = const ViewRecords();
    } else if (currentPage == DrawerSections.language) {
      container = const Language();
    } else if (currentPage == DrawerSections.chg_pass) {
      container = const Change_Password();
    } else if (currentPage == DrawerSections.about) {
      container = const About();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("$container"),
        centerTitle: true,
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //  DrawerHeader(
                //   decoration: const BoxDecoration(
                //     color: Colors.red,
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: const <Widget>[
                //       Text("Menu")
                //     ],
                //   ),
                // ),
                // const Text(
                //   "Menu",
                //   textAlign: TextAlign.center,
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                const MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == DrawerSections.home ? true : false),
          const Divider(),
          menuItem(2, "View All Recoreds", Icons.receipt_long_outlined,
              currentPage == DrawerSections.view_all_records ? true : false),
          const Divider(),
          menuItem(3, "Language", Icons.g_translate_outlined,
              currentPage == DrawerSections.language ? true : false),
          const Divider(),
          menuItem(4, "Change Password", Icons.lock_reset_outlined,
              currentPage == DrawerSections.chg_pass ? true : false),
          const Divider(),
          menuItem(5, "About", Icons.info_outline,
              currentPage == DrawerSections.about ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.view_all_records;
            } else if (id == 3) {
              currentPage = DrawerSections.language;
            } else if (id == 4) {
              currentPage = DrawerSections.chg_pass;
            } else if (id == 5) {
              currentPage = DrawerSections.about;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  home,
  // ignore: constant_identifier_names
  view_all_records,
  language,
  // ignore: constant_identifier_names
  chg_pass,
  about,
}
