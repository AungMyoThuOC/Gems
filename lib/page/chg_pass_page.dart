import 'package:flutter/material.dart';

class ChgPassPage extends StatefulWidget {
  const ChgPassPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChgPassPageState createState() => _ChgPassPageState();
}

class _ChgPassPageState extends State<ChgPassPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Change Password Page"),
      ),
    );
  }
}
