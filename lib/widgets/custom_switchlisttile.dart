import 'package:flutter/material.dart';
import 'package:project_sparshtandon_v6000/util/colors.dart';

class CustomSwitchListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  const CustomSwitchListTile(
      {Key? key, required this.title, this.subtitle, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,

          child: SwitchListTile(
            title: Text(title,
            style:  TextStyle(
              fontWeight: FontWeight.w600,
            ),),
            onChanged: (bool value) {},
            value: value,
            activeColor: ColorFile.teal_green,
            inactiveTrackColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}

// SwitchListTile(
// title: Text('Conversation Tones',style: TextStyle(
// fontWeight: FontWeight.w600,
// ),
// ),
// subtitle: Text('Play Sound For Incoming And Outgoing Messages'),
// value: _flutter,
// activeColor: ColorFile.teal_green,
// inactiveTrackColor: Colors.grey,
// onChanged: (bool value) {
// setState(() {
// _flutter = value;
// });
