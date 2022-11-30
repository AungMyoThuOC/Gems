// ignore_for_file: non_constant_identifier_names, unused_field, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/common.dart';
import 'package:gems_records/data/create_database.dart';
import 'package:gems_records/data/record.dart';
import 'package:gems_records/page/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class EditRecPage extends StatefulWidget {
  int id;
  int type;
  EditRecPage({
    Key? key,
    required this.id,
    required this.type,
  }) : super(key: key);

  @override
  State<EditRecPage> createState() => _EditRecPageState();
}

class _EditRecPageState extends State<EditRecPage> {
  String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _fromWhomController = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  bool checkType = false;
  bool checkWeight = false;
  bool checkPrice = false;
  bool checkFromWhom = false;
  bool checkPhone = false;

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageList;
  List record_image_list = [];
  // ignore: prefer_final_fields
  List<ChewieController>? _chewieController = [];
  Uint8List? imageBytes;
  bool loading = false;
  final _db = CreateDatabase.instance;
  String checkZero = "";

  Future<void> _selectMultiImage() async {
    final List<XFile>? pickedFileList = await _picker.pickMultiImage(
      maxWidth: 100000000000,
      maxHeight: 100000000000,
      imageQuality: 100,
    );
    setState(() {
      _imageList = pickedFileList;
      try {
        for (var i = 0; i < _imageList!.length; i++) {
          record_image_list.add(_imageList![i].path);
        }
      } catch (e) {
        print("empty");
      }
    });
  }

  Future<void> _takePhote() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 100000000000,
      maxHeight: 100000000000,
      imageQuality: 100,
    );
    setState(() {
      try {
        record_image_list.add(pickedFile!.path);
      } catch (e) {
        print("empty");
      }
    });
  }

  _data() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        date = DateFormat("yyyy-MM-dd").format(picked);
      });
    }
  }

  _addRecord() async {
    String firstImage = "";
    String secondImage = "";
    if (record_image_list.isNotEmpty) {
      firstImage = record_image_list[0];
    }
    if (record_image_list.length > 1) {
      secondImage = record_image_list[1];
    }

    if (_phonecontroller.text.startsWith("0")) {
      checkZero = "true";
    } else {
      checkZero = "false";
    }
    var record_map = Record(
      date,
      _typeController.text,
      _weightController.text,
      int.parse(_priceController.text),
      _fromWhomController.text,
      int.parse(_phonecontroller.text),
      _remarkController.text,
      jsonEncode(record_image_list),
      firstImage,
      secondImage,
      checkZero,
    );
    _db.createRecord(record_map).then((value) {
      loading = false;
    });
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: Home(
              id: widget.id,
            )));
    setState(() {});
  }

  void _showDialog(int id) async {
    setState(() {
      showModalBottomSheet(
          context: context,
          elevation: 5,
          isScrollControlled: true,
          builder: (_) => Container(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 25,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            // if (id == 0) {

                            // }
                            setState(() {
                              _takePhote();
                            });
                          },
                          child: Container(
                            color: Colors.white30,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    // "Take Photo",
                                    translation(context).take_photo,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: ubuntuFamily,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              _selectMultiImage();
                            });
                          },
                          child: Container(
                            color: Colors.white30,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/",
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    // "Choose Image",
                                    translation(context).cho_img,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: ubuntuFamily,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ));
    });
  }

  _editItem() async {
    String firstImage = "";
    String secondImage = "";
    if (record_image_list.isNotEmpty) {
      firstImage = record_image_list[0];
    }
    if (record_image_list.length > 1) {
      secondImage = record_image_list[1];
    }
    if (_phonecontroller.text.startsWith("0")) {
      checkZero = "true";
    } else {
      checkZero = "false";
    }
    var record_map = Record(
        date,
        _typeController,
        _weightController,
        int.parse(_priceController.text),
        _fromWhomController,
        int.parse(_phonecontroller.text),
        _remarkController,
        jsonEncode(record_image_list),
        firstImage,
        secondImage,
        checkZero);
    _db.editRecord(record_map, widget.type).then((value) {
      loading = false;
    });
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: Home(
              id: widget.id,
            )));
    setState(() {});
  }

  getEditDate() async {
    List data = await _db.getRecord(widget.type);
    setState(() {
      date = DateFormat("yyyy-MM-dd")
          .format(DateTime.parse(data[0]["record_date"]));
      _typeController.text = data[0]["record_type"].toString();
      _weightController.text = data[0]["record_weight"].toString();
      _priceController.text = data[0]["record_price"].toString();
      _fromWhomController.text = data[0]["record_fromWhom"];
      _phonecontroller.text = data[0]["checkZero"] == "true"
          ? "0${data[0]["record_phoneNum"]}"
          : data[0]["record_phoneNum"].toString();
      _remarkController.text = data[0]["record_remark"].toString();
      record_image_list = jsonDecode(data[0]["record_image_list"]);
    });
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {});
    });
  }

  _titleTextWidget(title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 15,
          fontFamily: ubuntuFamily,
        ),
      ),
    );
  }

  @override
  void initState() {
    getEditDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            widget.type == -1 
            // ? "New Item" : "Edit Item",
            ? translation(context).new_item
            : translation(context).edit_item,
            style: TextStyle(color: Colors.black, fontFamily: ubuntuFamily),
          ),
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: Home(id: widget.id)));
              setState(() {});
            },
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: Home(
                      id: widget.id,
                    )));
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleTextWidget(
                  // "Date",
                  translation(context).dat,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                  child: GestureDetector(
                    onTap: () => _data(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            DateFormat("dd-MM-yyyy")
                                .format(DateTime.parse(date)),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 0.7,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                _titleTextWidget(
                  // "Type"
                  translation(context).typ,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _typeController,
                        onChanged: (value) {
                          setState(() {
                            if (_typeController.text != "") {
                              checkType = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        ),
                      ),
                      checkType == true
                          ? errorTextWidget(
                              // "Enter type",
                              translation(context).ent_typ,
                            )
                          : Container(),
                    ],
                  ),
                ),
                _titleTextWidget(
                  // "Weight",
                  translation(context).weight,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _weightController,
                        onChanged: (value) {
                          setState(() {
                            if (_weightController.text != "") {
                              checkWeight = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        ),
                      ),
                      checkWeight
                          ? errorTextWidget(
                            // "Enter weight",
                            translation(context).ent_wei,
                            )
                          : Container(),
                    ],
                  ),
                ),
                _titleTextWidget(
                  // "Price",
                  translation(context).pri
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (_priceController.text != "") {
                              checkPrice = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        ),
                      ),
                      checkPrice ? errorTextWidget(
                        // "Enter price"
                        translation(context).ent_pri
                        ) : Container(),
                    ],
                  ),
                ),
                _titleTextWidget(
                  // "From Whom",
                  translation(context).froWhom,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _fromWhomController,
                        onChanged: (value) {
                          setState(() {
                            if (_fromWhomController.text != "") {
                              checkFromWhom = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        ),
                      ),
                      checkFromWhom
                          ? errorTextWidget(
                            // "Enter from whom",
                            translation(context).ent_froWho,
                            )
                          : Container(),
                    ],
                  ),
                ),
                _titleTextWidget(
                  // "Phone",
                  translation(context).ph
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _phonecontroller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (_phonecontroller.text != "") {
                              checkPhone = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        ),
                      ),
                      checkPhone
                          ? errorTextWidget(
                            // "Enter phone number"
                            translation(context).ent_ph,
                            )
                          : Container(),
                    ],
                  ),
                ),
                _titleTextWidget(
                  // "Remark"
                  translation(context).rmk
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: _remarkController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                    ),
                  ),
                ),
                record_image_list.isEmpty
                    ? Container()
                    : GridView.count(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        children:
                            List.generate(record_image_list.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => PreviewImageDialog(
                                        imagePath: record_image_list[index],
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  child: Image.file(
                                    File(record_image_list[index]),
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 0.1,
                                  top: 0.1,
                                  child: GestureDetector(
                                    onTap: () {
                                      record_image_list.removeAt(index);
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.transparent,
                                      child: const Icon(
                                        Icons.close,
                                        size: 25,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showDialog(0);
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                spreadRadius: 0.5,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                                color: Color.fromARGB(66, 53, 52, 52),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showDialog(1);
                          setState(() {});
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                spreadRadius: 0.5,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                                color: Color.fromARGB(66, 53, 52, 52),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.images,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        loading = true;
                        if (_typeController.text == "" &&
                            _weightController.text == "" &&
                            _priceController.text == "" &&
                            _fromWhomController.text == "" &&
                            _phonecontroller.text == "") {
                          checkType = true;
                          checkWeight = true;
                          checkPrice = true;
                          checkFromWhom = true;
                          checkPhone = true;
                          loading = false;
                        } else if (_typeController.text == "") {
                          checkType = true;
                          if (_weightController.text == "") {
                            checkWeight = true;
                          } else {
                            checkWeight = false;
                          }
                          if (_priceController.text == "") {
                            checkPrice = true;
                          } else {
                            checkPrice = false;
                          }
                          if (_fromWhomController.text == "") {
                            checkFromWhom = true;
                          } else {
                            checkFromWhom = false;
                          }
                          if (_phonecontroller.text == "") {
                            checkPhone = true;
                          } else {
                            checkPhone = false;
                          }
                          loading = false;
                        } else if (_weightController.text == "") {
                          checkWeight = true;
                          if (_typeController.text == "") {
                            checkType = true;
                          } else {
                            checkType = false;
                          }
                          if (_priceController.text == "") {
                            checkPrice = true;
                          } else {
                            checkPrice = false;
                          }
                          if (_fromWhomController.text == "") {
                            checkFromWhom = true;
                          } else {
                            checkFromWhom = false;
                          }
                          if (_phonecontroller.text == "") {
                            checkPhone = true;
                          } else {
                            checkPhone = false;
                          }
                          loading = false;
                        } else if (_priceController.text == "") {
                          checkPrice = true;
                          if (_typeController.text == "") {
                            checkType = true;
                          } else {
                            checkType = false;
                          }
                          if (_weightController.text == "") {
                            checkWeight = true;
                          } else {
                            checkWeight = false;
                          }
                          if (_fromWhomController.text == "") {
                            checkFromWhom = true;
                          } else {
                            checkFromWhom = false;
                          }
                          if (_phonecontroller.text == "") {
                            checkPhone = true;
                          } else {
                            checkPhone = false;
                          }
                          loading = false;
                        } else if (_fromWhomController.text == "") {
                          checkFromWhom = true;
                          if (_typeController.text == "") {
                            checkType = true;
                          } else {
                            checkType = false;
                          }
                          if (_priceController.text == "") {
                            checkPrice = true;
                          } else {
                            checkPrice = false;
                          }
                          if (_weightController.text == "") {
                            checkWeight = true;
                          } else {
                            checkWeight = false;
                          }
                          if (_phonecontroller.text == "") {
                            checkPhone = true;
                          } else {
                            checkPhone = false;
                          }
                          loading = false;
                        } else if (_phonecontroller.text == "") {
                          checkPhone = true;
                          if (_typeController.text == "") {
                            checkType = true;
                          } else {
                            checkType = false;
                          }
                          if (_priceController.text == "") {
                            checkPrice = true;
                          } else {
                            checkPrice = false;
                          }
                          if (_fromWhomController.text == "") {
                            checkFromWhom = true;
                          } else {
                            checkFromWhom = false;
                          }
                          if (_weightController.text == "") {
                            checkWeight = true;
                          } else {
                            checkWeight = false;
                          }
                          loading = false;
                        } else {
                          checkType = false;
                          checkWeight = false;
                          checkPrice = false;
                          checkFromWhom = false;
                          checkPhone = false;
                          if (widget.type == -1) {
                            _addRecord();
                          } else {
                            _editItem();
                          }
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Center(
                          child: loading == true
                              ? const SizedBox(
                                  width: 23,
                                  height: 23,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  // "Save Item",
                                  translation(context).sav_item,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: ubuntuFamily,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
