import 'dart:html';

import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("English"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  TextButton(
                    onPressed: () {},
                     child: Text("Myanmar")
                    )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}

// Stack(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     alignment: Alignment.center,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.white, Colors.white]
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10
//                       ),
//                       child: Container(
//                         width: 350,
//                         height: 360,
//                         decoration: BoxDecoration(
//                           boxShadow: const<BoxShadow> [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 7,
//                               spreadRadius: 10,
//                               offset: Offset(0.0, 3.0),
//                             )
//                           ],
//                           borderRadius: BorderRadius.circular(30).copyWith(
//                             topRight: const Radius.circular(20),
//                             topLeft: const Radius.circular(20)
//                           ),
//                           gradient: const LinearGradient(
//                             colors: [Colors.white, Colors.white]
//                           ),
//                         ),
//                         child: Container(
//                           margin: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30).copyWith(
//                               topRight: const Radius.circular(20),
//                               topLeft: const Radius.circular(20)
//                             ),
//                             gradient: const LinearGradient(
//                               colors: [Colors.white, Colors.white]
//                             )
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
