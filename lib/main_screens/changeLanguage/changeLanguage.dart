import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class changeLanguage extends StatefulWidget {
  const changeLanguage({Key? key}) : super(key: key);

  @override
  State<changeLanguage> createState() => _changeLanguageState();
}

class _changeLanguageState extends State<changeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text("English"),
            onTap: () {
              LocaleNotifier.of(context)?.change('en');
            },
          ),
          ListTile(
            title: Text("Vietnamese"),
            onTap: () {
              LocaleNotifier.of(context)?.change('vi');

            },
          ),

        ],
      ),
    );
  }
}
