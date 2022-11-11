import 'package:flutter/material.dart';
import 'package:gems_records/data/database.dart';
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
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            deleteFunction: (context) => deleteTask(index),
            editFunction: (context) => editTask(index),
          );
        },
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
