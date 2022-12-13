import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/router/route_constants.dart';

class ViewRecords extends StatefulWidget {
  const ViewRecords({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewRecordsState createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  TextEditingController userinput = TextEditingController();
  List<String> items = <String>["Datetime", "Type", "FromWhom", "Cancel"];

  String dropdownValue = "Type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).view_rec),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        child: _drawerList(),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Search....",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      )),
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
                // width: 80,
                child: DropdownButton<String>(
              value: dropdownValue,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue ?? '';
                });
              },
            ))
          ],
        ),
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
