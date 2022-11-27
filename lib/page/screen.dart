import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gems_records/data/create_database.dart';
import 'package:gems_records/page/Login/login_page.dart';
import 'package:gems_records/page/Login/register_page.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<Screen> {
  final _db = CreateDatabase.instance;

  startTimer() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() async {
    List data = await _db.getAcc();
    List accountList = [];
    accountList = data;
    if (accountList.isEmpty) {
      // ignore: use_build_context_synchronously
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginAccountPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "images/",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
