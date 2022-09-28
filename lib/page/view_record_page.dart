import 'package:flutter/material.dart';

class ViewRecords extends StatefulWidget {
  const ViewRecords({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewRecordsState createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("View All Record"),
      ),
    );
  }
}
