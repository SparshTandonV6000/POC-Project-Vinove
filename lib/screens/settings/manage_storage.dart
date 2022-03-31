import 'package:flutter/material.dart';

import '../../constants/data.dart';
import '../../util/colors.dart';

class ManageStorage extends StatefulWidget {
  const ManageStorage({Key? key}) : super(key: key);

  @override
  _ManageStorageState createState() => _ManageStorageState();
}

class _ManageStorageState extends State<ManageStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage Your Storage And Data',
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
              itemCount: storagepage.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(storagepage[index]["title"]),
                subtitle: Text(storagepage[index]["subtitle"]),
                leading: storagepage[index]["image"],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
