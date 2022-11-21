import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/data/database.dart';
import 'package:gems_records/router/route_constants.dart';
// import 'package:gems_records/page/new_rec_page.dart';
import 'package:gems_records/util/dialog_box.dart';
import 'package:gems_records/util/todo_tile.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController sercontr = TextEditingController();
  bool bottomNavigator = true;

  TextEditingController typecont = TextEditingController();
  TextEditingController weightcont = TextEditingController();
  TextEditingController pricecont = TextEditingController();
  TextEditingController fromwhomcont = TextEditingController();
  TextEditingController phonecont = TextEditingController();
  TextEditingController remarkcont = TextEditingController();

  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([typecont.text, false]);
      typecont.clear();
      weightcont.clear();
      pricecont.clear();
      fromwhomcont.clear();
      phonecont.clear();
      remarkcont.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            typecont: typecont,
            weightcont: weightcont,
            pricecont: pricecont,
            whomcont: fromwhomcont,
            phonecont: phonecont,
            remarkcont: remarkcont,
            onSave: saveNewTask,
            // ignore: null_check_always_fails
            // image: null!,
            // onSubmit: (String value) {  },
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void editTask(int index) {
    setState(() {
      // db.toDoList.(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: Text(translation(context).home),
          centerTitle: true,
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(50.0),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: _main(context),
          //   ),
          // ),
        ),
      ),
      drawer: Drawer(
        child: _drawerList(),
      ),
      floatingActionButton: (bottomNavigator == true)
          ? SizedBox(
              width: 45,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: createNewTask,
                // () {
                //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                //       builder: (context) => NewRecod(
                //             onSubmit: (String value) {},
                //             onSave: () {},
                //           )));
                // },
                splashColor: Colors.red,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Center(
        child: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              deleteFunction: (context) => deleteTask(index),
              editFunction: (context) => editTask(index),
            );
          },
        ),
      ),
    );
  }

  _main(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            controller: sercontr,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: "Search from Whom..",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromARGB(225, 224, 224, 244)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 177, 177, 177))),
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
                )),
          ),
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
              Icons.receipt_long_outlined,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).view_rec,
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, viewallRoute);
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



// appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80.0),
//         child: AppBar(
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           elevation: 0.0,
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(80.0),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 keyboardType: TextInputType.text,
//                 controller: sercontr,
//                 style: const TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   hintText: "Search With Form Whom",
//                   hintStyle: const TextStyle(
//                     color: Colors.grey,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: const BorderSide(
//                         width: 1, color: Color.fromARGB(225, 224, 224, 244)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5),
//                       borderSide: const BorderSide(
//                           width: 1, color: Color.fromARGB(255, 177, 177, 177))),
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.search_outlined,
//                         size: 20,
//                       ),
//                       splashRadius: 2,
//                     ),
//                   ),
//                   suffixIcon: IconButton(
//                     onPressed: sercontr.clear,
//                     icon: const Icon(
//                       Icons.clear_outlined,
//                       size: 20,
//                     ),
//                     splashRadius: 2,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
