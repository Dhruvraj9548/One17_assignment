import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:one17_techass/verify_code.dart';
import 'package:one17_techass/verify_code_pak.dart';
import 'package:one17_techass/verify_code_sa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  final phoneNumberController = TextEditingController();

  final auth = FirebaseAuth.instance;

  String selectedCountry = "India"; // Default selected country

  List<String> countries = ["India", "South Africa", "Pakistan"];


  void onCountryChanged(String newValue) {
    setState(() {
      selectedCountry = newValue;
    });
  }

  void navigateToCountryScreen() {

    switch(selectedCountry) {
      case "India": {
        auth.verifyPhoneNumber(

            phoneNumber: phoneNumberController.text,

            verificationCompleted: (e){

            },
            verificationFailed: (e){

            },
            codeSent: (String verificationId, int? token){
              Navigator.push(context, MaterialPageRoute(builder: (context) => verifyCodeScreen(verificationId: verificationId,),));
            },
            codeAutoRetrievalTimeout: (e){

            });
      }
      break;

      case "South Africa": {
        auth.verifyPhoneNumber(

            phoneNumber: phoneNumberController.text,

            verificationCompleted: (e){

            },
            verificationFailed: (e){

            },
            codeSent: (String verificationId, int? token){
              Navigator.push(context, MaterialPageRoute(builder: (context) => verifyCodeScreenSa(verificationId: verificationId,),));
            },
            codeAutoRetrievalTimeout: (e){

            });
      }
      break;

      case "Pakistan": {
        auth.verifyPhoneNumber(

            phoneNumber: phoneNumberController.text,

            verificationCompleted: (e) {

            },
            verificationFailed: (e) {

            },
            codeSent: (String verificationId, int? token) {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  verifyCodeScreenPak(verificationId: verificationId,),));
            },
            codeAutoRetrievalTimeout: (e) {

            });
      }
      break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country Selection"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
            ),
            DropdownButton<String>(
              value: selectedCountry,
              onChanged: (newValue) {
                onCountryChanged(newValue!);
              },
              items: countries.map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: navigateToCountryScreen,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}





