// ignore_for_file: unused_local_variable, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gems_records/page/home_page.dart';
import 'package:gems_records/util/my_button.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:gems_records/models/category.dart';

// ignore: must_be_immutable
class NewRecod extends StatefulWidget {
  NewRecod({Key? key, required this.onSubmit, required this.onSave})
      : super(key: key);

  VoidCallback onSave;

  final ValueChanged<String> onSubmit;
  
  get id => null;

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
  bool checkDelete = false;
  int result = 0;
  String catName = '';
  String resultType = '';

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
                context, MaterialPageRoute(builder: (context) =>  Home(id: widget.id,)));
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

            // for price
            // Container(
            //     width: 150.0,
            //     child: TextFormField(
            //       initialValue: widget.update ? order.price.toString() : null,
            //       autocorrect: false,
            //       onSaved: (String value) {
            //         price = int.parse(value);
            //       },
            //       validator: (value) {
            //         if (value.isEmpty ||
            //             !new RegExp(r'^[0-9]+$').hasMatch(value)) {
            //           return 'Please enter valid price';
            //         }
            //       },
            //       decoration: new InputDecoration(
            //         labelText: "Price",
            //         hintText: 'Price',
            //         prefixText: "Rs.",
            //       ),
            //       keyboardType: TextInputType.number,
            //     ),
            //   ),

              // 
            // ignore: avoid_unnecessary_containers
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         const Text("Weight"),
            //         TextFormField(
            //           autovalidateMode: submitted
            //               ? AutovalidateMode.onUserInteraction
            //               : AutovalidateMode.disabled,
            //           keyboardType: TextInputType.text,
            //           controller: weightcont,
            //           decoration: InputDecoration(
            //             errorText: _weightText,
            //             // labelText: "Type",
            //           ),
            //           onChanged: (text) => setState(() => text),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // ignore: avoid_unnecessary_containers
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         const Text("Price"),
            //         TextFormField(
            //           autovalidateMode: submitted
            //               ? AutovalidateMode.onUserInteraction
            //               : AutovalidateMode.disabled,
            //           keyboardType: TextInputType.number,
            //           // inputFormatters: <TextInputFormatter>[
            //           //   FilteringTextInputFormatter.digitsOnly
            //           // ],
            //           controller: pricecont,
            //           decoration: InputDecoration(
            //             errorText: _priceText,
            //             // labelText: "Type",
            //           ),
            //           onChanged: (text) => setState(() => text),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // ignore: avoid_unnecessary_containers
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         const Text("From Whom"),
            //         TextFormField(
            //           autovalidateMode: submitted
            //               ? AutovalidateMode.onUserInteraction
            //               : AutovalidateMode.disabled,
            //           keyboardType: TextInputType.text,
            //           controller: whomcont,
            //           decoration: InputDecoration(
            //             errorText: _fromwhomText,
            //             // labelText: "Type",
            //           ),
            //           onChanged: (text) => setState(() => text),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // ignore: avoid_unnecessary_containers
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         const Text("Phone"),
            //         TextFormField(
            //           autovalidateMode: submitted
            //               ? AutovalidateMode.onUserInteraction
            //               : AutovalidateMode.disabled,
            //           keyboardType: TextInputType.phone,
            //           inputFormatters: <TextInputFormatter>[
            //             FilteringTextInputFormatter.digitsOnly
            //           ],
            //           controller: phonecont,
            //           decoration: InputDecoration(errorText: _phoneText
            //               // labelText: "Type",
            //               ),
            //           onChanged: (text) => setState(() => text),
            //           validator: (value) {
            //             if (value!.isEmpty ||
            //                 !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
            //                     .hasMatch(value)) {
            //               return "Enter Correct Phone Number";
            //             } else {
            //               return null;
            //             }
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ignore: avoid_unnecessary_containers
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //       children: [
            //         const Text("Remark"),
            //         TextFormField(
            //           autovalidateMode: submitted
            //               ? AutovalidateMode.onUserInteraction
            //               : AutovalidateMode.disabled,
            //           keyboardType: TextInputType.text,
            //           controller: remarkcont,
            //           decoration: InputDecoration(
            //             errorText: _remarkText,
            //             // labelText: "Type",
            //           ),
            //           onChanged: (text) => setState(() => text),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // ignore: avoid_unnecessary_containers
            // Container(
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //         ],
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //           MaterialButton(
            //             child: const Icon(
            //               Icons.camera_enhance,
            //               size: 200,
            //             ),
            //             onPressed: () {
            //               pickImageC();
            //             },
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: 50,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyButton(
                      text: "Save",
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Home(id: widget.id,)));
                        });
                      })
                  // RaisedButton(
                  //   onPressed: () {
                  //     // if (catName == '') {
                  //     //   catName = "type";
                  //     // }
                  //     setState(() {
                  //       submitted = true;
                  //     });
                  //     Navigator.of(context).pushReplacement(
                  //         MaterialPageRoute(builder: (context) => const Home()));
                  //   },
                  //   child: const Text("Save"),
                  // ),
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

// class MyCategory extends StatefulWidget {
//   MyCategory(
//       {Key? key,
//       required this.cat,
//       required this.onClicked,
//       required this.delete,
//       required this.deleteClick})
//       : super(key: key);

//   final Cat cat;
//   final Function onClicked;
//   final Function deleteClick;
//   bool delete = false;

//   @override
//   State<MyCategory> createState() => _MyCategoryState();
// }

// class _MyCategoryState extends State<MyCategory> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           CircleAvatar(
//               radius: 25,
//               child: TextButton(
//                   onPressed: (widget.delete == false)
//                       ? () {
//                           widget.onClicked(widget.cat.name);
//                         }
//                       : () {
//                           widget.deleteClick(widget.cat.name);
//                         },
//                   child: Text(widget.cat.name)))
//         ],
//       ),
//     );
//   }
// }


 // Container(
            //   width: 400,
            //   height: 200,
            //   child: StreamBuilder<QuerySnapshot>(
            //     stream: DataRepository().getCat(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) return const LinearProgressIndicator();

            //       return GridView.count(
            //           scrollDirection: Axis.horizontal,
            //           addAutomaticKeepAlives: true,
            //           shrinkWrap: true,
            //           physics: const BouncingScrollPhysics(
            //               parent: AlwaysScrollableScrollPhysics()),
            //           crossAxisCount: 2,
            //           children: snapshot.data!.docs
            //               .map(
            //                 (e) => StreamBuilder<QuerySnapshot>(
            //                     stream: DataRepository().getType(),
            //                     builder: (context, snapshot) {
            //                       if (snapshot.connectionState ==
            //                           ConnectionState.waiting) {
            //                         return const CircularProgressIndicator();
            //                       }
            //                       var ds = snapshot.data!.docs;

            //                       List sum = [];

            //                       for (int i = 0; i < ds.length; i++) {
            //                         sum.add(ds[i]['catName']);
            //                       }

            //                       return MyCategory(
            //                         delete: checkDelete,
            //                         onClicked: (state, name) {
            //                           setState(() {
            //                             result = state;
            //                             catName = name;
            //                           });
            //                         },
            //                         cat: Cat.fromSnapshot(e),
            //                         deleteClick: (autoID, name) {
            //                           if (sum.isEmpty) {
            //                             DataRepository().deleteCat(autoID);
            //                           } else {
            //                             for (int i = 0; i < sum.length; i++) {
            //                               setState(() {
            //                                 resultType = name;
            //                               });
            //                               if (resultType == sum[i]) {
            //                                 showTopSnackBar(
            //                                     context,
            //                                     const CustomSnackBar.error(
            //                                         message: ""));
            //                               } else {
            //                                 DataRepository()
            //                                     .deleteCat(autoID);
            //                               }
            //                             }
            //                           }
            //                         },
            //                       );
            //                     }),
            //               )
            //               .toList());
            //     },
            //   ),
            // ),
