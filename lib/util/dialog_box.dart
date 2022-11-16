// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers, sized_box_for_whitespace

// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gems_records/util/my_button.dart';
import 'package:gems_records/util/textfields.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final typecont;
  final weightcont;
  final pricecont;
  final whomcont;
  final phonecont;
  final remarkcont;
  VoidCallback onSave;
  DialogBox(
      {Key? key,
      required this.typecont,
      required this.weightcont,
      required this.pricecont,
      required this.whomcont,
      required this.phonecont,
      required this.remarkcont,
      // required this.image,
      required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Textfield(
              onSubmit: (String value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(text: "Save", onPressed: onSave),
          ],
        )),
      ),
    );
  }
}
