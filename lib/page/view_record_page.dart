import 'package:flutter/material.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 350,
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
                  // ignore: sized_box_for_whitespace
                  Container(
                      width: 120,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
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
          ),
        ),
      ),
    );
  }
}
