import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Home"),
      ),
    );
  }
}


// decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: const Offset(0, 3),
//           )
//         ],
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         )
//       ),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Positioned(
//                 right: 10,
//                 child: SizedBox(
//                   width: 40,
//                   child: FloatingActionButton(
//                     elevation: 0,
//                     onPressed: (){},
//                     child: const Icon(
//                       Icons.add_outlined,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),