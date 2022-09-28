import 'package:flutter/material.dart';

// ignore: camel_case_types
class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Change_PasswordState createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Change Password Page"),
      ),
    );
  }
}
