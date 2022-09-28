import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Language Page"),
      ),
    );
  }
}
