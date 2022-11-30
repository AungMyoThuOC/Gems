// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gems_records/classes/language_constants.dart';

class Textfield extends StatefulWidget {
  const Textfield({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  final ValueChanged<String> onSubmit;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  TextEditingController typecont = TextEditingController();
  TextEditingController weightcont = TextEditingController();
  TextEditingController pricecont = TextEditingController();
  TextEditingController whomcont = TextEditingController();
  TextEditingController phonecont = TextEditingController();
  TextEditingController remarkcont = TextEditingController();

  bool submitted = false;
  File? image;

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

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
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const Text("Type"),
                // Text(translation(context).type),
                Text(translation(context).type),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // autovalidateMode: submitted
                  //     ? AutovalidateMode.onUserInteraction
                  //     : AutovalidateMode.disabled,
                  keyboardType: TextInputType.text,
                  controller: typecont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter type';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    // labelText: "Type",
                    hintText: "Type",
                    // errorText: _typeText,
                  ),
                  // onChanged: (text) => setState(() => text),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // const Text("Weight"),
                        Text(translation(context).weight),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // autovalidateMode: submitted
                          //     ? AutovalidateMode.onUserInteraction
                          //     : AutovalidateMode.disabled,
                          keyboardType: TextInputType.text,
                          controller: weightcont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter weight";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              // labelText: "Weight", 
                              hintText: "Weight"
                              // errorText: _weightText,
                              // labelText: "Type",
                              ),
                          // onChanged: (text) => setState(() => text),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // const Text("Price"),
                        Text(translation(context).price),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // autovalidateMode: submitted
                          //     ? AutovalidateMode.onUserInteraction
                          //     : AutovalidateMode.disabled,
                          keyboardType: TextInputType.number,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          controller: pricecont,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[1-9]\d{0,7}(?:\.\d{1,4})?|\.\d{1,4}$')
                                    .hasMatch(value)) {
                              return "Please enter valid price";
                            }
                            return null;
                          },
                          // validator: (value) {
                          //   if (value.isEmpty ||
                          //       !new RegExp(r'^[0-9]+$')
                          //           .hasMatch(value)) {
                          //     return 'Please enter valid price';
                          //   }
                          // },
                          decoration: const InputDecoration(
                              // labelText: "Price",
                               hintText: "Price"
                              // errorText: _priceText,
                              // labelText: "Type",
                              ),
                          // onChanged: (text) => setState(() => text),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // const Text("From Whom"),
                        Text(translation(context).from_whom),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // autovalidateMode: submitted
                          //     ? AutovalidateMode.onUserInteraction
                          //     : AutovalidateMode.disabled,
                          keyboardType: TextInputType.text,
                          controller: whomcont,
                          validator: (value) => value!.isEmpty
                              ? "Enter a valid name"
                              : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]')
                                      .hasMatch(value)
                                  ? "Enter a valide name"
                                  : null,
                          decoration: const InputDecoration(
                              // labelText: "From Whom", 
                              hintText: "From Whom"
                              // errorText: _fromwhomText,
                              // labelText: "Type",
                              ),
                          // onChanged: (text) => setState(() => text),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // const Text("Phone"),
                        Text(translation(context).phone),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // autovalidateMode: submitted
                          //     ? AutovalidateMode.onUserInteraction
                          //     : AutovalidateMode.disabled,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                          controller: phonecont,
                          decoration: const InputDecoration(
                              // labelText: "Phone", 
                              hintText: "Phone"),
                          // decoration:
                          //     InputDecoration(errorText: _phoneText
                          //         // labelText: "Type",
                          //         ),
                          // onChanged: (text) => setState(() => text),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                    .hasMatch(value)) {
                              return "Enter Correct Phone Number";
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // const Text("Remark"),
                        Text(translation(context).remark),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // autovalidateMode: submitted
                          //     ? AutovalidateMode.onUserInteraction
                          //     : AutovalidateMode.disabled,
                          keyboardType: TextInputType.text,
                          controller: remarkcont,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter some text";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              // labelText: "Remark", 
                              hintText: "Remark"
                              // errorText: _remarkText,
                              // labelText: "Type",
                              ),
                          //  onChanged: (text) => setState(() => text),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Cameraopt(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                      MaterialButton(
                        child: const Icon(
                          Icons.camera_enhance,
                          // size: 200,
                        ),
                        onPressed: () {
                          pickImageC();
                        },
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
