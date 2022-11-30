import 'package:flutter/material.dart';
import 'package:gems_records/classes/language_constants.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).not_found)
        // const Text("Not Found"),
      ),
      body: Center(
        child: Text(translation(context).s_w_c_n_f_y_p)
        // Text("Sorry, We couldn't found your page"),
      ),
    );
  }
}
