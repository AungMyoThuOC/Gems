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

            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         // const Text("Type"),
            //         TextFormField(
            //           autovalidateMode: AutovalidateMode.onUserInteraction,
            //           // autovalidateMode: submitted
            //           //     ? AutovalidateMode.onUserInteraction
            //           //     : AutovalidateMode.disabled,
            //           keyboardType: TextInputType.text,
            //           controller: typecont,
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Please enter type';
            //             }
            //             return null;
            //           },
            //           decoration: const InputDecoration(
            //             labelText: "Type",
            //             hintText: "Type",
            //             // errorText: _typeText,
            //           ),
            //           // onChanged: (text) => setState(() => text),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 // const Text("Weight"),
            //                 TextFormField(
            //                   autovalidateMode:
            //                       AutovalidateMode.onUserInteraction,
            //                   // autovalidateMode: submitted
            //                   //     ? AutovalidateMode.onUserInteraction
            //                   //     : AutovalidateMode.disabled,
            //                   keyboardType: TextInputType.text,
            //                   controller: weightcont,
            //                   validator: (value) {
            //                     if (value == null || value.isEmpty) {
            //                       return "Please enter weight";
            //                     }
            //                     return null;
            //                   },
            //                   decoration: const InputDecoration(
            //                       labelText: "Weight", hintText: "Weight"
            //                       // errorText: _weightText,
            //                       // labelText: "Type",
            //                       ),
            //                   // onChanged: (text) => setState(() => text),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 // const Text("Price"),
            //                 TextFormField(
            //                   autovalidateMode:
            //                       AutovalidateMode.onUserInteraction,
            //                   // autovalidateMode: submitted
            //                   //     ? AutovalidateMode.onUserInteraction
            //                   //     : AutovalidateMode.disabled,
            //                   keyboardType: TextInputType.number,
            //                   // inputFormatters: <TextInputFormatter>[
            //                   //   FilteringTextInputFormatter.digitsOnly
            //                   // ],
            //                   controller: pricecont,
            //                   validator: (value) {
            //                     if (value == null ||
            //                         value.isEmpty ||
            //                         !RegExp(r'^[1-9]\d{0,7}(?:\.\d{1,4})?|\.\d{1,4}$')
            //                             .hasMatch(value)) {
            //                       return "Please enter valid price";
            //                     }
            //                     return null;
            //                   },
            //                   // validator: (value) {
            //                   //   if (value.isEmpty ||
            //                   //       !new RegExp(r'^[0-9]+$')
            //                   //           .hasMatch(value)) {
            //                   //     return 'Please enter valid price';
            //                   //   }
            //                   // },
            //                   decoration: const InputDecoration(
            //                       labelText: "Price", hintText: "Price"
            //                       // errorText: _priceText,
            //                       // labelText: "Type",
            //                       ),
            //                   // onChanged: (text) => setState(() => text),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 // const Text("From Whom"),
            //                 TextFormField(
            //                   autovalidateMode:
            //                       AutovalidateMode.onUserInteraction,
            //                   // autovalidateMode: submitted
            //                   //     ? AutovalidateMode.onUserInteraction
            //                   //     : AutovalidateMode.disabled,
            //                   keyboardType: TextInputType.text,
            //                   controller: whomcont,
            //                   validator: (value) => value!.isEmpty
            //                       ? "Enter a valid name"
            //                       : RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]')
            //                               .hasMatch(value)
            //                           ? "Enter a valide name"
            //                           : null,
            //                   decoration: const InputDecoration(
            //                       labelText: "From Whom",
            //                       hintText: "From Whom"
            //                       // errorText: _fromwhomText,
            //                       // labelText: "Type",
            //                       ),
            //                   // onChanged: (text) => setState(() => text),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 // const Text("Phone"),
            //                 TextFormField(
            //                   autovalidateMode:
            //                       AutovalidateMode.onUserInteraction,
            //                   // autovalidateMode: submitted
            //                   //     ? AutovalidateMode.onUserInteraction
            //                   //     : AutovalidateMode.disabled,
            //                   keyboardType: TextInputType.phone,
            //                   inputFormatters: <TextInputFormatter>[
            //                     FilteringTextInputFormatter.digitsOnly
            //                   ],
            //                   controller: phonecont,
            //                   decoration: const InputDecoration(
            //                       labelText: "Phone", hintText: "Phone"),
            //                   // decoration:
            //                   //     InputDecoration(errorText: _phoneText
            //                   //         // labelText: "Type",
            //                   //         ),
            //                   // onChanged: (text) => setState(() => text),
            //                   validator: (value) {
            //                     if (value!.isEmpty ||
            //                         !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
            //                             .hasMatch(value)) {
            //                       return "Enter Correct Phone Number";
            //                     } else {
            //                       return null;
            //                     }
            //                   },
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.stretch,
            //               children: [
            //                 // const Text("Remark"),
            //                 TextFormField(
            //                   autovalidateMode:
            //                       AutovalidateMode.onUserInteraction,
            //                   // autovalidateMode: submitted
            //                   //     ? AutovalidateMode.onUserInteraction
            //                   //     : AutovalidateMode.disabled,
            //                   keyboardType: TextInputType.text,
            //                   controller: remarkcont,
            //                   validator: (value) {
            //                     if (value == null || value.isEmpty) {
            //                       return "Please enter some text";
            //                     }
            //                     return null;
            //                   },
            //                   decoration: const InputDecoration(
            //                       labelText: "Remark", hintText: "Remark"
            //                       // errorText: _remarkText,
            //                       // labelText: "Type",
            //                       ),
            //                   //  onChanged: (text) => setState(() => text),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         // Cameraopt(),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         // Container(
            //         //   child: Cameraopt(),
            //         // ),
