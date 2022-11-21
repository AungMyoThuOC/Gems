import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: double.infinity,
              height: 30,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text("Save")),
            ),
          )
        ],
      ),
    );
  }
}

// appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(130.0),
//         child: AppBar(
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           elevation: 0.0,
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(100.0),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextFormField(
//                     controller: chgpassCon,
//                     decoration: const InputDecoration(
//                       labelText: "password",
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   // ignore: sized_box_for_whitespace
//                   child: Container(
//                     width: double.infinity,
//                     height: 30,
//                     child: ElevatedButton(
//                       onPressed: (){}, 
//                       child: const Text(
//                         "Save"
//                       )
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
