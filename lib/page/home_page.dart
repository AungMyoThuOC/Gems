import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController sercontr = TextEditingController();
  bool bottomNavigator = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: sercontr,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Search With Form Whom",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(225, 224, 224, 244)
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(
                        255, 177, 177, 177
                      )
                    )
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_outlined,
                        size: 20,
                      ),
                      splashRadius: 2,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: sercontr.clear,
                    icon: const Icon(
                      Icons.clear_outlined,
                      size: 20,
                    ),
                    splashRadius: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: (bottomNavigator == true)
          ? SizedBox(
              width: 45,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                splashColor: Colors.red,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

