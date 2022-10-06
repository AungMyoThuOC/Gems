// ignore_for_file: unused_local_variable, deprecated_member_use

// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gems_records/page/home_page.dart';
import 'package:image_picker/image_picker.dart';

class NewRecod extends StatefulWidget {
  const NewRecod({Key? key, required this.onSubmit}) : super(key: key);

  final ValueChanged<String> onSubmit;

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

  bool submitted = false;

  void type() {
    setState(() => submitted = true);
    if (_typeText == null) {
      widget.onSubmit(typecont.value.text);
    }
  }

  void weight() {
    setState(() => submitted = true);

    if (_weightText == null) {
      widget.onSubmit(weightcont.value.text);
    }
  }

  void price() {
    setState(() => submitted = true);

    if (_priceText == null) {
      widget.onSubmit(pricecont.value.text);
    }
  }

  void fromwhom() {
    setState(() => submitted = true);

    if (_fromwhomText == null) {
      widget.onSubmit(whomcont.value.text);
    }
  }

  void phone() {
    setState(() => submitted = true);

    if (_phoneText == null) {
      widget.onSubmit(phonecont.value.text);
    }
  }

  void remark() {
    setState(() => submitted = true);

    if (_remarkText == null) {
      widget.onSubmit(remarkcont.value.text);
    }
  }

  @override
  void deactivate() {
    typecont.dispose();
    weightcont.dispose();
    pricecont.dispose();
    whomcont.dispose();
    phonecont.dispose();
    remarkcont.dispose();

    super.deactivate();
  }

  String? get _typeText {
    final text = typecont.value.text;

    if (text.isEmpty) {
      return "can't be empty";
    }
    return null;
  }

  String? get _weightText {
    final text = weightcont.value.text;

    if (text.isEmpty) {
      return "can't be empty";
    }
    return null;
  }

  String? get _priceText {
    final text = pricecont.value.text;

    if (text.isEmpty) {
      return "can't be empty";
    }
    return null;
  }

  String? get _fromwhomText {
    final text = whomcont.value.text;

    if (text.isEmpty) {
      return "can't be empty";
    }
    return null;
  }

  String? get _phoneText {
    final text = phonecont.value.text;

    if (text.isEmpty) {
      return "can't be empty";
    }
    return null;
  }

  String? get _remarkText {
    final text = remarkcont.value.text;

    if (text.isEmpty) {
      return "can't be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 3,
          onPressed: () {
            // Navigator.popAndPushNamed(context, '/home');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => const Home()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("NewRecod"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
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
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.text,
                      controller: typecont,
                      decoration: InputDecoration(
                        // labelText: "Type",
                        errorText: _typeText,
                      ),
                      onChanged: (text) => setState(() => text),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.text,
                      controller: weightcont,
                      decoration: InputDecoration(
                        errorText: _weightText,
                        // labelText: "Type",
                      ),
                      onChanged: (text) => setState(() => text),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.number,
                      // inputFormatters: <TextInputFormatter>[
                      //   FilteringTextInputFormatter.digitsOnly
                      // ],
                      controller: pricecont,
                      decoration: InputDecoration(
                        errorText: _priceText,
                        // labelText: "Type",
                      ),
                      onChanged: (text) => setState(() => text),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.text,
                      controller: whomcont,
                      decoration: InputDecoration(
                        errorText: _fromwhomText,
                        // labelText: "Type",
                      ),
                      onChanged: (text) => setState(() => text),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: phonecont,
                      decoration: InputDecoration(errorText: _phoneText
                          // labelText: "Type",
                          ),
                      onChanged: (text) => setState(() => text),
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
            const SizedBox(
              height: 20,
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
                      autovalidateMode: submitted
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      keyboardType: TextInputType.text,
                      controller: remarkcont,
                      decoration: InputDecoration(
                        errorText: _remarkText,
                        // labelText: "Type",
                      ),
                      onChanged: (text) => setState(() => text),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                  onPressed: () {
                    setState(() {
                      submitted = true;
                    });
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
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
