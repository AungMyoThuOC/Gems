// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/data/create_database.dart';
import 'package:gems_records/page/screen.dart';
import 'package:gems_records/router/custom_router.dart';
// import 'package:gems_records/router/route_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:hive_flutter/adapters.dart';

final _db = CreateDatabase.instance;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void deactivate() {
    getLocale().then((locale) => {setLocale(locale)});
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gems Records",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: CustomRouter.generatedRoute,
      home: const Screen(),
      locale: _locale,
    );
  }
}
