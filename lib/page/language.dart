import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gems_records/l10n/l10n.dart';
import 'package:gems_records/provider/locale_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int selectedLang = 1;

  getLang() async {
    final prefs = await SharedPreferences.getInstance();
    final int? lang = prefs.getInt('Language');
    setState(() {
      selectedLang = (lang == null) ? 1 : lang;
    });
  }

  @override
  void initState() {
    getLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(
                            "images/English.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child:
                                const Text("English"),
                                // Text(translation(context).english)
                              ),
                        // RadioListTile<int>(
                        //   value: 1,
                        //   groupValue: selectedLang,
                        //   title: Text("English"),
                        //   onChanged: (value) async {
                        //     final prefs = await SharedPreferences.getInstance();
                        //     prefs.setInt("language", 1);
                        //     setState(() {
                        //       selectedLang = 1;
                        //       final provider = Provider.of<LocaleProvider>(
                        //           context,
                        //           listen: false);
                        //       provider.setLocale(Locale('en'));
                        //     });
                        //   },
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Image(
                          width: 30,
                          height: 30,
                          image: AssetImage(
                            "images/Myanmar.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child:
                              const Text("Myanmar")
                              // Text(translation(context).myanmar),
                        ),
                        // RadioListTile(
                        //     value: 2,
                        //     groupValue: selectedLang,
                        //     title: Text("မြန်မာ"),
                        //     onChanged: (value) async {
                        //       final prefs =
                        //           await SharedPreferences.getInstance();
                        //       prefs.setInt('language', 2);
                        //       setState(() {
                        //         selectedLang = 2;
                        //         final provider = Provider.of<LocaleProvider>(
                        //             context,
                        //             listen: false);
                        //         provider.setLocale(Locale('my'));
                        //       });
                        //     })
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

// Stack(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     alignment: Alignment.center,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [Colors.white, Colors.white]
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10
//                       ),
//                       child: Container(
//                         width: 350,
//                         height: 360,
//                         decoration: BoxDecoration(
//                           boxShadow: const<BoxShadow> [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 7,
//                               spreadRadius: 10,
//                               offset: Offset(0.0, 3.0),
//                             )
//                           ],
//                           borderRadius: BorderRadius.circular(30).copyWith(
//                             topRight: const Radius.circular(20),
//                             topLeft: const Radius.circular(20)
//                           ),
//                           gradient: const LinearGradient(
//                             colors: [Colors.white, Colors.white]
//                           ),
//                         ),
//                         child: Container(
//                           margin: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30).copyWith(
//                               topRight: const Radius.circular(20),
//                               topLeft: const Radius.circular(20)
//                             ),
//                             gradient: const LinearGradient(
//                               colors: [Colors.white, Colors.white]
//                             )
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
