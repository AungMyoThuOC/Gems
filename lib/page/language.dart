// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:gems_records/classes/language.dart';
import 'package:gems_records/classes/language_constants.dart';
import 'package:gems_records/main.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).language),
        centerTitle: true,
      ),
      body: Center(
        child: DropdownButton<Language>(
          iconSize: 25,
          hint: Text(translation(context).changelanguage),
          onChanged: (Language? language) async {
            if (language != null) {
              Locale _locale = await setLocale(language.languageCode);
              MyApp.setLocale(context, _locale);
            }
          },
          items: Language.languageList().map<DropdownMenuItem<Language>>(
            (e) => DropdownMenuItem<Language> (
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: const TextStyle(
                      fontSize: 30
                    ),
                  ),
                  Text(e.name)
                ],
              ),
            )
          )
          .toList(),
        ),
      ),
    );
  }
}
