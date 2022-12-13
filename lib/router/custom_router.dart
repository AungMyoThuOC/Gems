// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gems_records/page/about_page.dart';
import 'package:gems_records/page/chg_pass_page.dart';
import 'package:gems_records/page/home_page.dart';
import 'package:gems_records/page/language.dart';
// import 'package:gems_records/page/new_rec_page.dart';
// import 'package:gems_records/page/view_record_page.dart';
import 'package:gems_records/page/not_found_page.dart';
import 'package:gems_records/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        var widget;
        return MaterialPageRoute(builder: (_) => Home(id: widget.id,));   
      case languageRoute:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      // case changpassRout:
      //   return MaterialPageRoute(builder: (_) => const Change_Password());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => const About());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
