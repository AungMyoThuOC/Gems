import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gems_records/common.dart';
import 'package:gems_records/data/create_acc.dart';
import 'package:gems_records/data/create_database.dart';
import 'package:gems_records/util/textfields.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class CreateAccountPage extends StatefulWidget {
  int checkPage;
  int id;
  CreateAccountPage({Key? key, required this.checkPage, required this.id})
      : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool checkName = false;
  bool checkPhone = false;
  bool checkPassword = false;
  bool checkObscureText = true;
  final _db = CreateDatabase.instance;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageList;
  List getAccountList = [];
  String image_path = "";
  String checkZero = "";

  Future<void> _selectImage() async {
    final XFile? pickerFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 100,
      maxHeight: 100,
      imageQuality: 100,
    );
    setState(() {
      _setImageFileListFromFile(pickerFile);
    });
  }

  void _setImageFileListFromFile(XFile? value) {
    _imageList = value == null ? null : <XFile>[value];
    if (_imageList != null) {
      image_path = _imageList![0].path.toString();
    }
    setState(() {});
  }

  Future<void> _createAccount() async {
    if (_phoneNoController.text.startsWith("0")) {
      checkZero = "true";
    } else {
      checkZero = "false";
    }
    var acc_map = AccMap(
        _nameController.text,
        int.parse(_phoneNoController.text),
        _passwordController.text,
        image_path,
        checkZero);
    _db.createAcc(acc_map);
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: HomePage(id: 1), type: PageTransitionType.rightToLeft));
    setState(() {});
  }

  Future<void> _editAccount() async {
    if (_phoneNoController.text.startsWith("0")) {
      checkZero = "true";
    } else {
      checkZero = "false";
    }
    var acc_map = AccMap(
        _nameController.text,
        int.parse(_phoneNoController.text),
        _passwordController,
        image_path,
        checkZero);
    _db.editAcc(acc_map, getAccountList[0]["AutoId"]);
    Navigator.pushReplacement(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: Homepage(
              id: 1,
            )));
    setState(() {});
  }

  _checkPage() async {
    if (widget.checkPage == 1) {
      List data = await _db.getAcc();
      getAccountList = data;
      _nameController.text = getAccountList[0]["name"];
      _phoneNoController.text = getAccountList[0]["checkZero"] == "true"
          ? "0${getAccountList[0]["phonenum"]}"
          : getAccountList[0]["phonenum"].toString();
      _passwordController.text = getAccountList[0]["password"].toString();
      image_path = getAccountList[0]["image"];
    }
    setState(() {});
  }

  @override
  void initState() {
    _checkPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: widget.id == 2
                        ? const RegisterPage()
                        : HomePage(id: widget.id),
                  ));
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
                    child: widget.id == 2
                        ? const RegisterPage()
                        : HomePage(id: widget.id)));
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: GestureDetector(
                      onTap: () {
                        _selectImage();
                        setState(() {});
                      },
                      child: _imageList == null
                          ? widget.checkPage == 1 && image_path != ""
                              ? Container(
                                  width: 100,
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundImage: FileImage(
                                      File(image_path),
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[200],
                                    child: const Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                          : Container(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                backgroundImage: FileImage(
                                  File(_imageList![0].path),
                                ),
                              ),
                            )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _nameController,
                        onChanged: (value) {
                          setState(() {
                            if (_nameController.text != "") {
                              checkName = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26))),
                      ),
                      checkName ? errorTextWidget("Enter name") : Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _phoneNoController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (_phoneNoController.text != "") {
                              checkPhone = false;
                            }
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: "Phone number",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26))),
                      ),
                      checkPhone
                          ? errorTextWidget("Enter phone number")
                          : Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _passwordController,
                        obscureText: checkObscureText,
                        onChanged: (value) {
                          setState(() {
                            if (_passwordController.text != "") {
                              checkPassword = false;
                            }
                          });
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26)),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  checkObscureText = !checkObscureText;
                                  setState(() {});
                                },
                                icon: Icon(
                                  checkObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black45,
                                ))),
                      ),
                      checkPassword
                          ? errorTextWidget("Enter password")
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      if (_nameController.text == "" &&
                          _phoneNoController.text == "" &&
                          _passwordController.text == "") {
                            
                          }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
