// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gems_records/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  DialogBox({Key? key, required this.controller, required this.onSave})
      : super(key: key);

  String? get _typeText {
    final text = controller.value.text;

    if (text.isEmpty) {
      return "can't be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Type"),
                    TextFormField(
                      // autovalidateMode: submitted
                      //     ? AutovalidateMode.onUserInteraction
                      //     : AutovalidateMode.disabled,
                      keyboardType: TextInputType.text,
                      controller: controller,
                      decoration: InputDecoration(
                        // labelText: "Type",
                        errorText: _typeText,
                      ),
                      // onChanged: (text) => setState(() => text),
                    ),
                    MyButton(text: "Save", onPressed: onSave),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
