import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_sparshtandon_v6000/widgets/prfrences.dart';

import 'package:project_sparshtandon_v6000/screens/settings/notifications.dart';
import 'package:project_sparshtandon_v6000/screens/whatsapp_home.dart';

import 'package:project_sparshtandon_v6000/welcom_screen/signin.dart';
import 'package:project_sparshtandon_v6000/welcom_screen/welcom.dart';

import 'localisation/app_localization_deligate.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  cameras = await availableCameras();
  print("cameras$cameras");
  Preference.load().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    var lang = Preference.getString(Preference.language, def: "en");
    _locale = Locale(lang ?? "en");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var lang = Preference.getString(Preference.language, def: "en");
    _locale = Locale(lang ?? "en");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WhatsApp Clone',
        locale: _locale,
        supportedLocales: [
          Locale('en', ''),
          Locale('fr', ''),
        ],
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              _locale = supportedLocale;
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey, //here is where the error resides
        ),
        home: WelcomeScreen(title: '',));
  }
}
