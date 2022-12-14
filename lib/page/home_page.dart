// ignore_for_file: sized_box_for_whitespace

import 'dart:io';
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/common.dart';
import 'package:gems_records/data/create_database.dart';
import 'package:gems_records/page/Login/create_acc_page.dart';
// import 'package:gems_records/data/database.dart';
import 'package:gems_records/page/Record/add_edit_rec_page.dart';
import 'package:gems_records/page/home/details_page.dart';
import 'package:gems_records/router/route_constants.dart';
// import 'package:gems_records/util/dialog_box.dart';
// import 'package:gems_records/util/gem_tile.dart';
// import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  int id;
  Home({Key? key, required this.id}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController sercontr = TextEditingController();

  final _db = CreateDatabase.instance;
  List getAccountList = [];
  List getDataList = [];
  List searchList = [];
  bool check = false;
  bool searchCheck = false;

  _getAcc() async {
    List data = await _db.getAcc();
    getAccountList = data;
    setState(() {});
  }

  _getData() async {
    List data = await _db.getRecords();
    getDataList = data;
    if (data.isEmpty) {
      check = true;
    }
    setState(() {});
  }

  saveIdInsharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("home_id", widget.id);
    setState(() {});
  }
  // bool bottomNavigator = true;

  // TextEditingController typecont = TextEditingController();
  // TextEditingController weightcont = TextEditingController();
  // TextEditingController pricecont = TextEditingController();
  // TextEditingController fromwhomcont = TextEditingController();
  // TextEditingController phonecont = TextEditingController();
  // TextEditingController remarkcont = TextEditingController();

  // final _myBox = Hive.box('mybox');
  // GemDataBase db = GemDataBase();

  @override
  void initState() {
    _getAcc();
    _getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      // ignore: sort_child_properties_last
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: widget.id == 0
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: CreateAccountPage(
                                    checkPage: 0,
                                    id: widget.id,
                                  )));
                          setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundImage: const AssetImage(
                            "images/person.jpg",
                          ),
                          backgroundColor: Colors.grey[350],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hello, ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: ubuntuFamily,
                          fontSize: 25,
                        ),
                      )
                    ],
                  )
                : getAccountList.isEmpty
                    ? Container()
                    : Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: CreateAccountPage(
                                        checkPage: 1,
                                        id: widget.id,
                                      )));
                              setState(() {});
                            },
                            child: getAccountList[0] ["image"] == ""
                              ? CircleAvatar(
                                backgroundImage: const AssetImage(
                                  "images/person.jpg"
                                ),
                                backgroundColor: Colors.grey[350],
                              )
                              : CircleAvatar(
                                backgroundImage: FileImage(
                                  File(getAccountList[0]["image"]),
                                ),
                              ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Hello, ${getAccountList[0]["name"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: ubuntuFamily,
                              fontSize: 20,
                            ),
                          )
                        ],
                      )),
        drawer: Drawer(
          child: _drawerList(),
        ),
        body: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextField(
                    maxLines: 1,
                    controller: sercontr,
                    onSubmitted: (val) {
                      if (sercontr.text != "") {
                        searchList.clear();
                        for (var i = 0; i < getDataList.length; i++) {
                          if (getDataList[i]["record_fromWhom"]
                              .toString()
                              .toLowerCase()
                              .contains(sercontr.text.toLowerCase())) {
                            searchList.add(getDataList[i]);
                          }
                        }
                        if (searchList.isEmpty) {
                          searchCheck = true;
                        } else {
                          searchCheck = false;
                        }
                      } else {
                        searchList.clear();
                        searchCheck = false;
                        _getData();
                      }
                      setState(() {});
                    },
                    onChanged: (value) {
                      if (sercontr.text != "") {
                        searchList.clear();
                        for (var i = 0; i < getDataList.length; i++) {
                          if (getDataList[i]["record_fromWhom"]
                              .toString()
                              .toLowerCase()
                              .contains(sercontr.text.toLowerCase())) {
                            searchList.add(getDataList[i]);
                          }
                        }
                        if (searchList.isEmpty) {
                          searchCheck = true;
                        } else {
                          searchCheck = false;
                        }
                      } else {
                        searchList.clear();
                        searchCheck = false;
                        _getData();
                      }
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: "From Whom....",
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                        ),
                        suffix: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            sercontr.text = "";
                            searchCheck = false;
                            searchList.clear();
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.close,
                            color: sercontr.text == ""
                                ? Colors.transparent
                                : Colors.black45,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder()),
                  ),
                ),
                searchList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              right: 16,
                              left: 16,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                List myList = await _db
                                    .getRecord(searchList[index]["AutoId"]);
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: DetailPage(
                                          id: widget.id,
                                          list: myList,
                                        )));
                                setState(() {});
                              },
                              child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 85,
                                            child: Text(
                                              searchList[index]["record_type"],
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: ubuntuFamily,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            width: 85,
                                            child: Text(
                                              DateFormat("dd-MM-yyyy")
                                                  .format(DateTime.parse(
                                                searchList[index]
                                                    ["record_date"],
                                              )),
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: ubuntuFamily,
                                                color: Colors.black45,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          searchList[index]["first_image"] == ""
                                              ? Container()
                                              : Image.file(
                                                  File(
                                                    searchList[index]
                                                        ["first_image"],
                                                  ),
                                                  width: 75,
                                                  height: 75,
                                                ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          searchList[index]["second_image"] ==
                                                  ""
                                              ? Container()
                                              : Image.file(
                                                  File(
                                                    searchList[index]
                                                        ["second_image"],
                                                  ),
                                                  width: 75,
                                                  height: 75,
                                                )
                                        ],
                                      ),
                                      PopupMenuButton(
                                        itemBuilder: (a) => [
                                          PopupMenuItem(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .rightToLeft,
                                                        child: EditRecPage(
                                                          id: widget.id,
                                                          type:
                                                              searchList[index]
                                                                  ["AutoID"],
                                                        )));
                                                setState(() {});
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.edit,
                                                    color: Colors.black,
                                                    size: 15,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    // "Edit",
                                                    translation(context).edit,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            child: TextButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                          title: Text(
                                                            // "Are you sure you want to delete this type?",
                                                            translation(context)
                                                                .a_y_s_y_w_t_d_t_t,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    ubuntuFamily),
                                                          ),
                                                          content: Container(
                                                            height: 60,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      // "Type :",
                                                                      translation(
                                                                              context)
                                                                          .type,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            ubuntuFamily,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      searchList[
                                                                              index]
                                                                          [
                                                                          "record_type"],
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            ubuntuFamily,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      // "From Whom :",
                                                                      translation(context).from_whom,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontFamily:
                                                                            ubuntuFamily,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          130,
                                                                      child:
                                                                          Text(
                                                                        searchList[index]
                                                                            [
                                                                            "record_fromWhom"],
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontFamily:
                                                                              ubuntuFamily,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          actions: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .black,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  child: Text(
                                                                    // "No",
                                                                    translation(
                                                                            context)
                                                                        .no,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white70),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  _db.deleteRecord(
                                                                      searchList[
                                                                              index]
                                                                          [
                                                                          "AutoID"]);
                                                                  Navigator.pushReplacement(
                                                                      context,
                                                                      PageTransition(
                                                                          type: PageTransitionType.rightToLeft,
                                                                          child: Home(
                                                                            id: widget.id,
                                                                          )));
                                                                });
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .black,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  child: Text(
                                                                    // "Yes",
                                                                    translation(
                                                                            context)
                                                                        .yes,
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ));
                                                setState(() {});
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.delete,
                                                    color: Colors.black,
                                                    size: 15,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    // "Delete",
                                                    translation(context).delete,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : searchCheck == true
                        ? Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Text(
                              // "Item don't have",
                              translation(context).itm_don_ha,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontFamily: ubuntuFamily,
                              ),
                            ),
                          )
                        : check == true
                            ? Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Text(
                                  // "No item",
                                  translation(context).no_item,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontFamily: ubuntuFamily,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: getDataList.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16,
                                      right: 16,
                                      left: 16,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        List myList = await _db.getRecord(
                                            getDataList[index]["AutoID"]);
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: DetailPage(
                                                  id: widget.id,
                                                  list: myList,
                                                )));
                                        setState(() {});
                                      },
                                      child: Card(
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 85,
                                                    child: Text(
                                                      getDataList[index]
                                                          ["record_type"],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            ubuntuFamily,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    width: 85,
                                                    child: Text(
                                                      DateFormat("dd-MM-yyyy")
                                                          .format(DateTime.parse(
                                                              getDataList[index]
                                                                  [
                                                                  "record_date"])),
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            ubuntuFamily,
                                                        color: Colors.black45,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  getDataList[index]
                                                              ["first_image"] ==
                                                          ""
                                                      ? Container()
                                                      : Image.file(
                                                          File(
                                                            getDataList[index]
                                                                ["first_image"],
                                                          ),
                                                          width: 75,
                                                          height: 75,
                                                        ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  getDataList[index][
                                                              "secomd_image"] ==
                                                          ""
                                                      ? Container()
                                                      : Image.file(
                                                          File(getDataList[
                                                                  index]
                                                              ["second_image"]),
                                                          width: 75,
                                                          height: 75,
                                                        )
                                                ],
                                              ),
                                              PopupMenuButton(
                                                itemBuilder: (a) => [
                                                  PopupMenuItem(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator
                                                            .pushReplacement(
                                                                context,
                                                                PageTransition(
                                                                    type: PageTransitionType
                                                                        .rightToLeft,
                                                                    child:
                                                                        EditRecPage(
                                                                      id: widget
                                                                          .id,
                                                                      type: getDataList[
                                                                              index]
                                                                          [
                                                                          "AutoID"],
                                                                    )));
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.edit,
                                                            color: Colors.black,
                                                            size: 15,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Text(
                                                            // "Edit",
                                                            translation(context)
                                                                .edit,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (_) =>
                                                                    AlertDialog(
                                                                      title:
                                                                          Text(
                                                                        // "Are you sure you want to delete this type",
                                                                        translation(context)
                                                                            .a_y_s_y_w_t_d_t_t,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              ubuntuFamily,
                                                                        ),
                                                                      ),
                                                                      content:
                                                                          Container(
                                                                        height:
                                                                            60,
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      // "Type : ",
                                                                                      translation(context).type,
                                                                                      style: TextStyle(
                                                                                        fontSize: 15,
                                                                                        fontFamily: ubuntuFamily,
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Text(
                                                                                      getDataList[index]["record_type"],
                                                                                      style: TextStyle(
                                                                                        fontSize: 15,
                                                                                        fontFamily: ubuntuFamily,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      // "From Whom :",
                                                                                      translation(context).from_whom,
                                                                                      style: TextStyle(
                                                                                        fontSize: 15,
                                                                                        fontFamily: ubuntuFamily,
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Container(
                                                                                      width: 130,
                                                                                      child: Text(
                                                                                        getDataList[index]["record_fromWhom"],
                                                                                        style: TextStyle(
                                                                                          fontSize: 15,
                                                                                          fontFamily: ubuntuFamily,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                        ),
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      actions: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                Colors.black,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(15),
                                                                              child: Text(
                                                                                // "No",
                                                                                translation(context).no,
                                                                                style: const TextStyle(
                                                                                  color: Colors.white70,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              _db.deleteRecord(getDataList[index]["AutoId"]);
                                                                              Navigator.pushReplacement(
                                                                                  context,
                                                                                  PageTransition(
                                                                                      type: PageTransitionType.rightToLeft,
                                                                                      child: Home(
                                                                                        id: widget.id,
                                                                                      )));
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            color:
                                                                                Colors.black,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(15),
                                                                              child: Text(
                                                                                // "Yes",
                                                                                translation(context).yes,
                                                                                style: const TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                        setState(() {});
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.delete,
                                                            color: Colors.black,
                                                            size: 15,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Text(
                                                            // "Delete",
                                                            translation(context)
                                                                .delete,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          splashColor: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: EditRecPage(
                      id: widget.id,
                      type: -1,
                    )));
            setState(() {});
          },
          elevation: 5,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container _drawerList() {
    // ignore: no_leading_underscores_for_local_identifiers
    TextStyle _textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 15,
    );
    // ignore: avoid_unnecessary_containers
    return Container(
      // color: selected ? Colors.grey[300] : Colors.transparent,
      // color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 90,
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Text(
                        translation(context).menu,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    )
                  ],
                )
                // Text(translation(context).menu)
                ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).home,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to Home Page
              Navigator.pushNamed(context, homeRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.g_translate_outlined,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).language,
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, languageRoute);
            },
          ),
          const Divider(),
          // ListTile(
          //   leading: const Icon(
          //     Icons.lock_reset_outlined,
          //     color: Colors.red,
          //     size: 20,
          //   ),
          //   title: Text(
          //     translation(context).chg_pass,
          //     style: _textStyle,
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, changpassRout);
          //   },
          // ),
          // const Divider(),
          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              translation(context).about,
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
        ],
      ),
    );
  }
}
