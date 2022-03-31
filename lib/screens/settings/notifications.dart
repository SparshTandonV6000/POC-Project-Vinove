import 'package:flutter/material.dart';

import '../../constants/data.dart';
import '../../util/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  bool _flutter = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorFile.teal_green,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchListTile(
                title: Text('Conversation Tones',style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                ),
                subtitle: Text('Play Sound For Incoming And Outgoing Messages'),
                value: _flutter,
                activeColor: ColorFile.teal_green,
                inactiveTrackColor: Colors.grey,
                onChanged: (bool value) {
                  setState(() {
                    _flutter = value;
                  });
                },
              ),
            ),
            Divider(
              height: 1,
              thickness: 0.5,
              indent: 4,
              endIndent: 0,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 15.0, 0.0, 0.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Messages',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,


                  itemCount: account1.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(account1[index]["title"]),
                    subtitle:Text(account1[index]["subtitle"]),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchListTile(
                title: Text('Use High Priority Notifications',style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                ),
                subtitle: Text('Show Previews of the notification at the top of the screen'),
                value: _flutter,
                activeColor: ColorFile.teal_green,
                inactiveTrackColor: Colors.grey,
                onChanged: (bool value) {
                  setState(() {
                    _flutter = value;
                  });
                },
              ),
            ),
            Divider(
              height: 1,
              thickness: 0.5,
              indent: 4,
              endIndent: 0,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 15.0, 0.0, 0.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Groups',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,



                  itemCount: account1.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(account1[index]["title"]),
                    subtitle:Text(account1[index]["subtitle"]),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchListTile(
                title: Text('Use High Priority Notifications',style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                ),
                subtitle: Text('Show Previews of the notification at the top of the screen'),
                value: _flutter,
                activeColor: ColorFile.teal_green,
                inactiveTrackColor: Colors.grey,
                onChanged: (bool value) {
                  setState(() {
                    _flutter = value;
                  });
                },
              ),
            ),

            Divider(
              height: 1,
              thickness: 0.5,
              indent: 4,
              endIndent: 0,
              color: Colors.grey,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(22.0, 15.0, 0.0, 0.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Calls',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,



                  itemCount: account2.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(account2[index]["title"]),
                    subtitle:Text(account2[index]["subtitle"]),
                  )),
            ),






          ],
        ),
      ),
    );
  }
}
