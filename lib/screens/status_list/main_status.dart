import 'package:flutter/material.dart';
import 'package:project_sparshtandon_v6000/localisation/strings.dart';
import 'package:project_sparshtandon_v6000/screens/status_list/storypage.dart';
import 'package:project_sparshtandon_v6000/util/colors.dart';


import '../camera_screen.dart';

class StatusHome extends StatefulWidget {
  const StatusHome({Key? key}) : super(key: key);

  @override
  _StatusHomeState createState() => _StatusHomeState();
}

class _StatusHomeState extends State<StatusHome> {


  List recent_updates=[
    {
      "name":"kartik",
      "timedy":"Today,09:20 AM",
      "image":""
    }


  ];
  List viewed_updates=[

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:16.0),
            child: Container(
              height: 45,
              width: 45,
              child: FittedBox(
                child: FloatingActionButton(


                    child: Icon(Icons.edit,color:Colors.grey[900],),
                    backgroundColor: Colors.grey[300],
                    onPressed: () {}),
              ),
            ),
          ),

          FloatingActionButton(

              child: Icon(Icons.camera_alt,
              color: Colors.white,),
              backgroundColor: ColorFile.teal_green,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
              }),
        ],
      ),
      body: Container(
        color: Color(0xfff2f2f2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: Colors.white,
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://s3.amazonaws.com/wll-community-production/images/no-avatar.png"),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 1.0,
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                  title: Text(
                    "My Status",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Tap to add status update"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Viewed updates",
                style:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzUY9KaIKHJt7I-nUz6XkdxDIiBN1BMDpVLA&usqp=CAU"),
                      ),
                      title: Text(
                        "Aditya",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Today, 20:16 PM"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoryPageView())),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
