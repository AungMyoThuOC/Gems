// import 'package:flutter/material.dart';
// import 'package:gems_records/util/my_button.dart';
// class DialogBox extends StatefulWidget {
//   final typecont;
//   final weightcont;
//   final pricecont;
//   final whomcont;
//   final phonecont;
//   final remarkcont;
//   VoidCallback onSave;
//   final ValueChanged<String> onSubmit;
//   DialogBox(
//       {Key? key,
//       required this.typecont,
//       required this.weightcont,
//       required this.pricecont,
//       required this.whomcont,
//       required this.phonecont,
//       required this.remarkcont,
//       required this.onSave,
//       required this.onSubmit})
//       : super(key: key);

//   @override
//   State<DialogBox> createState() => _DialogBoxState();
// }

// class _DialogBoxState extends State<DialogBox> {
//   TextEditingController typecont = TextEditingController();
//   TextEditingController weightcont = TextEditingController();
//   TextEditingController pricecont = TextEditingController();
//   TextEditingController whomcont = TextEditingController();
//   TextEditingController phonecont = TextEditingController();
//   TextEditingController remarkcont = TextEditingController();

//   bool submitted = false;

//   void type() {
//     setState(() => submitted = true);
//     if (_typeText == null) {
//       widget.onSubmit(typecont.value.text);
//     }
//   }

//   void weight() {
//     setState(() => submitted = true);

//     if (_weightText == null) {
//       widget.onSubmit(weightcont.value.text);
//     }
//   }

//   void price() {
//     setState(() => submitted = true);

//     if (_priceText == null) {
//       widget.onSubmit(pricecont.value.text);
//     }
//   }

//   void fromwhom() {
//     setState(() => submitted = true);

//     if (_fromwhomText == null) {
//       widget.onSubmit(whomcont.value.text);
//     }
//   }

//   void phone() {
//     setState(() => submitted = true);

//     if (_phoneText == null) {
//       widget.onSubmit(phonecont.value.text);
//     }
//   }

//   void remark() {
//     setState(() => submitted = true);

//     if (_remarkText == null) {
//       widget.onSubmit(remarkcont.value.text);
//     }
//   }

//   @override
//   void deactivate() {
//     typecont.dispose();
//     weightcont.dispose();
//     pricecont.dispose();
//     whomcont.dispose();
//     phonecont.dispose();
//     remarkcont.dispose();

//     super.deactivate();
//   }

//   String? get _typeText {
//     final text = typecont.value.text;

//     if (text.isEmpty) {
//       return "can't be empty";
//     }
//     return null;
//   }

//   String? get _weightText {
//     final text = weightcont.value.text;

//     if (text.isEmpty) {
//       return "can't be empty";
//     }
//     return null;
//   }

//   String? get _priceText {
//     final text = pricecont.value.text;

//     if (text.isEmpty) {
//       return "can't be empty";
//     }
//     return null;
//   }

//   String? get _fromwhomText {
//     final text = whomcont.value.text;

//     if (text.isEmpty) {
//       return "can't be empty";
//     }
//     return null;
//   }

//   String? get _phoneText {
//     final text = phonecont.value.text;

//     if (text.isEmpty) {
//       return "can't be empty";
//     }
//     return null;
//   }

//   String? get _remarkText {
//     final text = remarkcont.value.text;

//     if (text.isEmpty) {
//       return "can't be empty";
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       const Text("Type"),
//                       TextFormField(
//                         autovalidateMode: submitted
//                             ? AutovalidateMode.onUserInteraction
//                             : AutovalidateMode.disabled,
//                         keyboardType: TextInputType.text,
//                         controller: typecont,
//                         decoration: InputDecoration(
//                           // labelText: "Type",
//                           errorText: _typeText,
//                         ),
//                         onChanged: (text) => setState(() => text),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               const Text("Weight"),
//                               TextFormField(
//                                 autovalidateMode: submitted
//                                     ? AutovalidateMode.onUserInteraction
//                                     : AutovalidateMode.disabled,
//                                 keyboardType: TextInputType.text,
//                                 controller: weightcont,
//                                 decoration: InputDecoration(
//                                   errorText: _weightText,
//                                   // labelText: "Type",
//                                 ),
//                                 onChanged: (text) => setState(() => text),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               const Text("Price"),
//                               TextFormField(
//                                 autovalidateMode: submitted
//                                     ? AutovalidateMode.onUserInteraction
//                                     : AutovalidateMode.disabled,
//                                 keyboardType: TextInputType.number,
//                                 // inputFormatters: <TextInputFormatter>[
//                                 //   FilteringTextInputFormatter.digitsOnly
//                                 // ],
//                                 // inputFormatters: <TextInputFormatter>[
//                                 //   FilteringTextInputFormatter.digitsOnly
//                                 // ],
//                                 controller: pricecont,
//                                 decoration: InputDecoration(
//                                   errorText: _priceText,
//                                   // labelText: "Type",
//                                 ),
//                                 onChanged: (text) => setState(() => text),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               const Text("From Whom"),
//                               TextFormField(
//                                 autovalidateMode: submitted
//                                     ? AutovalidateMode.onUserInteraction
//                                     : AutovalidateMode.disabled,
//                                 keyboardType: TextInputType.text,
//                                 controller: whomcont,
//                                 decoration: InputDecoration(
//                                   errorText: _fromwhomText,
//                                   // labelText: "Type",
//                                 ),
//                                 onChanged: (text) => setState(() => text),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // ignore: avoid_unnecessary_containers
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               const Text("Phone"),
//                               TextFormField(
//                                 autovalidateMode: submitted
//                                     ? AutovalidateMode.onUserInteraction
//                                     : AutovalidateMode.disabled,
//                                 keyboardType: TextInputType.phone,
//                                 // inputFormatters: <TextInputFormatter>[
//                                 //   FilteringTextInputFormatter.digitsOnly
//                                 // ],
//                                 controller: phonecont,
//                                 decoration:
//                                     InputDecoration(errorText: _phoneText
//                                         // labelText: "Type",
//                                         ),
//                                 onChanged: (text) => setState(() => text),
//                                 validator: (value) {
//                                   if (value!.isEmpty ||
//                                       !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
//                                           .hasMatch(value)) {
//                                     return "Enter Correct Phone Number";
//                                   } else {
//                                     return null;
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       // ignore: avoid_unnecessary_containers
//                       Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               const Text("Remark"),
//                               TextFormField(
//                                 autovalidateMode: submitted
//                                     ? AutovalidateMode.onUserInteraction
//                                     : AutovalidateMode.disabled,
//                                 keyboardType: TextInputType.text,
//                                 controller: remarkcont,
//                                 decoration: InputDecoration(
//                                   errorText: _remarkText,
//                                   // labelText: "Type",
//                                 ),
//                                 onChanged: (text) => setState(() => text),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       MyButton(
//                           text: "Save",
//                           onPressed: onSave)
//                       // MyButton(
//                       //     text: "Save",
//                       //     onPressed: onSave;
//                       //     // () {
//                       //     //   setState(() {
//                       //     //     submitted = true;
//                       //     //   });
//                       //     // }
//                       //   ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }