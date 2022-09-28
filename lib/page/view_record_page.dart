import 'package:flutter/material.dart';

class ViewRecordPage extends StatefulWidget {
  const ViewRecordPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewRecordPageState createState() => _ViewRecordPageState();
}

class _ViewRecordPageState extends State<ViewRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("View All Record"),
      ),
    );
  }
}
