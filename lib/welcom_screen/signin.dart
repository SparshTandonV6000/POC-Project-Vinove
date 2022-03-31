import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'otpscreen.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}


class _SignInPageState extends State<SignInPage> {
  TextEditingController _codeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  List<String> dropdown = ["INDIA", "USA", "RUSSIA", "UKRAINE"];
  var valued;
  static String tphone="";
  //SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationID = "";

  loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "${_codeController.text + _phoneController.text}",

      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        // otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Verifying the number", style: TextStyle(color: Colors.teal)),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.teal,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("WhatsApp will  verify your phone number.Whats my number "),
            Container(
              width: size.width * 0.6,
              child: DropdownButton<String>(
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Country"),
                ),
                value: valued,
                isExpanded: true,
                items: dropdown.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black54),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    valued = value;
                  });
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.1,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _codeController,
                      decoration: InputDecoration(hintText: "code"),
                      onChanged: (code) {
                        setState(() {
                          tphone = tphone + code;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Container(
                    width: size.width * 0.4,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _phoneController,
                      decoration: InputDecoration(hintText: "Mobile Number"),
                      onChanged: (phone) {
                        setState(() {
                          tphone = tphone + phone;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Next'),
              onPressed: ()async {

                print("aditya$tphone");
                await loginWithPhone();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  OtpScreen(verificationID: verificationID)));

              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle:
                  TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
