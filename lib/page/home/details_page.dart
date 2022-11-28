import 'dart:convert';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gems_records/common.dart';
import 'package:gems_records/data/create_database.dart';
import 'package:gems_records/page/Record/add_edit_rec_page.dart';
import 'package:gems_records/page/home_page.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class DetailPage extends StatefulWidget {
  int id;
  List list;
  DetailPage({
    Key? key,
    required this.id,
    required this.list,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _db = CreateDatabase.instance;
  List getIndexDashboardList = [];
  List imageList = [];
  List<ChewieController>? _chewieController = [];
  bool check = false;
  late TransformationController controller;

  _getData() {
    getIndexDashboardList = widget.list;
    imageList = jsonDecode(getIndexDashboardList[0]["record_image_list"]);
    setState(() {});
  }

  _text(title, text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: ubuntuFamily,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: ubuntuFamily,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black26,
            thickness: 0.5,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    _getData();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        check = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Home(
                      id: widget.id,
                    )));
            setState(() {});
          },
        ),
        title: Text(
          "View item",
          style: TextStyle(
            color: Colors.black,
            fontFamily: ubuntuFamily,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.adaptive.more,
              color: Colors.black,
            ),
            itemBuilder: (a) => [
              PopupMenuItem(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: EditRecPage(
                                id: widget.id,
                                type: getIndexDashboardList[0]["AutoID"],
                              )));
                      setState(() {});
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )
                      ],
                    )),
              ),
              PopupMenuItem(
                child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(
                                  "Are you sure you want to delete this type?",
                                  style: TextStyle(
                                    fontFamily: ubuntuFamily,
                                  ),
                                ),
                                content: Container(
                                  height: 60,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Type : ",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: ubuntuFamily,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            getIndexDashboardList[0]
                                                ["record_type"],
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "From Whom : ",
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
                                              getIndexDashboardList[0]
                                                  ["record_fromWhom"],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: ubuntuFamily,
                                                  overflow:
                                                      TextOverflow.ellipsis),
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
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      color: Colors.black,
                                      child: const Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _db.deleteRecord(
                                            getIndexDashboardList[0]["AutoID"]);
                                        Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: Home(
                                                  id: widget.id,
                                                )));
                                      });
                                    },
                                    child: Container(
                                      color: Colors.black,
                                      child: const Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ));
                      setState(() {});
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        )
                      ],
                    )),
              )
            ],
          )
        ],
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
        child: check == false
            ? const Center(
                child: SpinKitRing(
                  color: Colors.black,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _text(
                        "Date",
                        DateFormat("dd-MM-yyyy").format(DateTime.parse(
                            getIndexDashboardList[0]["record_date"]))),
                    _text("Type", getIndexDashboardList[0]["record_type"]),
                    _text("From Whom",
                        getIndexDashboardList[0]["record_fromWhom"]),
                    _text("Weight", getIndexDashboardList[0]["record_weight"]),
                    _text(
                        "Price",
                        NumberFormat.decimalPattern()
                            .format(getIndexDashboardList[0]["record_price"])
                            .toString()),
                    _text(
                        "Phone",
                        getIndexDashboardList[0]["checkZero"] == "true"
                            ? "0${getIndexDashboardList[0]["record_phoneNum"]}"
                            : getIndexDashboardList[0]["record_phoneNum"]
                                .toString()),
                    _text("Remark", getIndexDashboardList[0]["record_remark"]),
                    imageList.isEmpty
                        ? Container()
                        : GridView.count(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            children: List.generate(imageList.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) => PreviewImageDialog(
                                        imagePath: imageList[index],
                                      ),
                                    );
                                    setState(() {});
                                  },
                                  child: Image.file(
                                    File(imageList[index]),
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    for (var i = 0; i < _chewieController!.length; i++) {
      _chewieController![i].pause();
    }
    setState(() {
      
    });
    super.dispose();
  }
}
