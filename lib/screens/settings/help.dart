import 'package:flutter/material.dart';

import '../../constants/data.dart';
import '../../util/colors.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              //shrinkWrap: true,
              itemCount: help.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(help[index]["title"]),
                //subtitle: Text(help[index]["subtitle"]),
                leading: help[index]["image"],
              ),
            ),
          ),
        ],
      ),


    );
  }
}
