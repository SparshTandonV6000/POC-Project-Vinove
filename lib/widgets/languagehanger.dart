import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_sparshtandon_v6000/widgets/prfrences.dart';
import 'package:project_sparshtandon_v6000/util/colors.dart';

import '../localisation/strings.dart';
import '../main.dart';

enum Language { English, French }

class ChatsSetting extends StatefulWidget {
  const ChatsSetting({Key? key}) : super(key: key);

  @override
  State<ChatsSetting> createState() => _ChatsSettingState();
}

class _ChatsSettingState extends State<ChatsSetting> {
  int _langGroup = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          Strings.of(context)!.Chats,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: ColorFile.teal_green_dark,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.center,
            child: RadioListTile<int>(
              value: 0,
              groupValue: _langGroup,
              onChanged: (value) {
                setState(() {
                  _langGroup = value ?? 0;
                });
                MyApp.setLocale(context, Locale("en"));
                Preference.setString(Preference.language, "en");
              },
              title: Text(
                Strings.of(context)!.English,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.center,
            child: RadioListTile<int>(
              value: 1,
              groupValue: _langGroup,
              onChanged: (value) {
                setState(() {
                  _langGroup = value ?? 0;
                });
                MyApp.setLocale(context, Locale("fr"));
                Preference.setString(Preference.language, "fr");
              },
              title: Text(
                Strings.of(context)!.French,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*SettingOption(
          title: Strings.of(context)!.AppLang, leading: Icon(CupertinoIcons.globe, color: Colors.grey,), subtitle: 'Phone Language',
          onTap: (){
            PopupMenuButton(
                onSelected: (result) {
                  if (result == 1) {

                    MyApp.setLocale(context, Locale("en"));
                    Preference.setString(Preference.language, "en");

                  } else {
                    MyApp.setLocale(context, Locale("fr"));
                    Preference.setString(Preference.language, "fr");
                  }
                },
                itemBuilder: (context) => [

              PopupMenuItem(
                child: Text('English'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('French'),
                value: 2,
              ),
            ]);
          }),*/

