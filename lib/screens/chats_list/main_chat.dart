import 'package:flutter/material.dart';
import 'package:project_sparshtandon_v6000/screens/chats_list/people_list.dart';

import '../../constants/data.dart';

import '../../util/colors.dart';
import 'chat_screen.dart';

class ChatsHome extends StatefulWidget {
  const ChatsHome({Key? key}) : super(key: key);

  @override
  _ChatsHomeState createState() => _ChatsHomeState();
}

class _ChatsHomeState extends State<ChatsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message_rounded,
            color: Colors.white,),
          backgroundColor: ColorFile.teal_green_dark,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PeopleList()));
          }),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: whatsapp.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChatScreen(
                  name: whatsapp[index]["title"],
                  imagePath: whatsapp[index]["image"],
                )));
          },
          title: Text(whatsapp[index]["title"]),
          subtitle: Text(whatsapp[index]["subtitle"]),
          leading: CircleAvatar(
            backgroundImage: AssetImage(whatsapp[index]["image"]),
          ),
          trailing: Text(
            whatsapp[index]["trailing"],
          ),
        ),
      ),
    );
  }
}
