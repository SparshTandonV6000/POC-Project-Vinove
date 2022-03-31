import 'package:flutter/material.dart';
import 'package:project_sparshtandon_v6000/screens/settings/settingsMain.dart';
import 'package:project_sparshtandon_v6000/screens/status_list/main_status.dart';
import 'package:project_sparshtandon_v6000/util/colors.dart';

import '../widgets/itemalerat.dart';
import '../localisation/strings.dart';
import 'calls_list/main_call.dart';
import 'camera_screen.dart';
import 'chats_list/main_chat.dart';
import 'chats_list/people_list.dart';
import 'chats_list/screen1.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({Key? key}) : super(key: key);

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,

        child: Scaffold(
          appBar:
          AppBar(
            automaticallyImplyLeading: false,

            backgroundColor: ColorFile.teal_green_dark,
            title: Text(
              Strings.of(context)!.WhatsApp,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              _selectedIndex == 1
                  ? PopupMenuButton(
                  onSelected: (result) {
                    if (result == 1) {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const NewGroupScreen(),
                      //   ),
                      // );
                    } else if (result == 2) {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const NewBroadcastScreen(),
                      //   ),
                      // );
                    } else if (result == 3) {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const LinkedDeviceScreen(),
                      //   ),
                      // );
                    } else if (result == 4) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    } else if (result == 5) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    }
                  },
                  color: Colors.white,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(Strings.of(context)!.NewGroup),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text(Strings.of(context)!.NewBroadcast),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text(Strings.of(context)!.LinkedDevice),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text(Strings.of(context)!.StarredMessages),
                      value: 4,
                    ),
                    PopupMenuItem(
                      child: Text(Strings.of(context)!.Payments),
                      value: 5,
                    ),
                    PopupMenuItem(
                      child: Text(Strings.of(context)!.Settings),
                      value: 6,
                    ),
                  ])
                  : _selectedIndex == 2
                  ? PopupMenuButton(
                  onSelected: (result) {
                    if (result == 1) {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //     const StatusPrivacyScreen(),
                      //   ),
                      // );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    }
                  },
                  color: Colors.white,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child:
                      Text(Strings.of(context)!.StatusPrivacy),
                      value: 1,
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                            const SettingsScreen(),
                          ),
                        );
                      },
                      child: Text(Strings.of(context)!.Settings),
                      value: 2,
                    )
                  ])
                  : PopupMenuButton(
                  onSelected: (result) {
                    if (result == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MyAlertDialogue(
                              title:
                              'Do you want to clear your entire log',
                              content: 'content',
                              opt1: 'CANCEL',
                              opt2: 'OK'),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    }
                  },
                  color: Colors.white,
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                            const SettingsScreen(),
                          ),
                        );
                      },
                      child:
                      Text(Strings.of(context)!.ClearCallLogs),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text(Strings.of(context)!.Settings),
                      value: 2,
                    ),
                  ]),
            ],
            bottom: TabBar(
              onTap: (int selected) {
                setState(() {
                  _selectedIndex = selected;
                });
              },
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorWeight: 3,
              labelStyle: TextStyle(fontWeight: FontWeight.w500),
              tabs: [
                Tab(icon: Icon(Icons.camera_alt_rounded)),
                Tab(text: Strings.of(context)!.Chats),
                Tab(text: Strings.of(context)!.Status),
                Tab(text: Strings.of(context)!.Calls),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CameraScreen(),
              ChatsListPage(),
              StatusHome(),
              CallsHome(),
            ],
          ),
        ));
  }
}