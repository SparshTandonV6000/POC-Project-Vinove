import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_sparshtandon_v6000/screens/settings/manage_storage.dart';
import 'package:project_sparshtandon_v6000/screens/settings/profile.dart';

import '../../constants/data.dart';
import '../../widgets/languagehanger.dart';
import '../../util/colors.dart';
import '../../widgets/settingoption.dart';
import 'account_page.dart';
import 'help.dart';
import 'notifications.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorFile.teal_green,
        leading: IconButton(
            icon: Icon(Icons.arrow_back,
            color: Colors.white,),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListTile(
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn2.vectorstock.com/i/1000x1000/23/81/default-avatar-profile-icon-vector-18942381.jpg"),
                  ),
                ],
              ),
              title: GestureDetector(
                onTap: (){    Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                ); },
                child: Text(
                    FirebaseAuth.instance.currentUser!.displayName.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text("Avaliable"),
            ),
          ),
          Divider(
            endIndent: 5,
            indent: 5,
          ),
          SettingOption(
              title: 'Account',
              subtitle: 'Privacy, security, change number',
              leading: Icon(Icons.vpn_key_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountPage(title: '',),
                  ),
                );
              }),
          SettingOption(
              title: 'Chats',
              subtitle: 'Theme, wallpaper, chat history',
              leading: Icon(Icons.chat_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatsSetting(),
                  ),
                );
              }),
          SettingOption(
              title: 'Notifications',
              subtitle: 'Message, grooup & call tone',
              leading: Icon(Icons.notifications),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Notifications(),
                  ),
                );
              }),
          SettingOption(
              title: 'Storage and Data',
              subtitle: 'Network usage, auto-download',
              leading: Icon(Icons.storage),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ManageStorage(),
                  ),
                );
              }),
          SettingOption(
              title: 'Help',
              subtitle: 'Help centre, contact us, privacy policy',
              leading: Icon(Icons.help_outline_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Help(),
                  ),
                );
              }),
          SettingOption(
              title: 'Invite a friend',
              leading: Icon(Icons.call),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountPage(title: '',),
                  ),
                );
              }),
          // MetaLogo()
        ],
      ),
    );
  }
}
