// ignore_for_file: unused_local_variable, deprecated_member_use

// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class NewRecod extends StatefulWidget {
  const NewRecod({Key? key}) : super(key: key);

  @override
  State<NewRecod> createState() => _NewRecodState();
}

class _NewRecodState extends State<NewRecod> {
  DateTime dateTime = DateTime(2022, 10, 4);

  TextEditingController typecont = TextEditingController();
  TextEditingController weightcont = TextEditingController();
  TextEditingController pricecont = TextEditingController();
  TextEditingController whomcont = TextEditingController();
  TextEditingController phonecont = TextEditingController();
  TextEditingController remarkcont = TextEditingController();

  File? image;

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Date"),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: pickDateTime,
                      child: Text(
                          "${dateTime.year}/${dateTime.month}/${dateTime.day}"),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Type"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: typecont,
                      decoration: const InputDecoration(
                          // labelText: "Type",
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Weight"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: weightcont,
                      decoration: const InputDecoration(
                          // labelText: "Type",
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Price"),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: pricecont,
                      decoration: const InputDecoration(
                          // labelText: "Type",
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("From Whom"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: whomcont,
                      decoration: const InputDecoration(
                          // labelText: "Type",
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Phone"),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: phonecont,
                      decoration: const InputDecoration(
                          // labelText: "Type",
                          ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value)) {
                          return "Enter Correct Phone Numver";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Remark"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: remarkcont,
                      decoration: const InputDecoration(
                          // labelText: "Type",
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return; // pressed "CANCEL"

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
    );

    setState(() => this.dateTime = dateTime);
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
}
