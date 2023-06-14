import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/main_screens/Before_entering/first_loading_screen.dart';



Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Locales.init(['en','vi']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
    builder: (locale) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstLoad(),
      localizationsDelegates: Locales.delegates,
      supportedLocales: Locales.supportedLocales,
      locale: locale,
    ),
    );
  }
}
