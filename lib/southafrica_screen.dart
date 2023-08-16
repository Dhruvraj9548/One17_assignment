import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SouthAfricaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("AppSA"),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyScreen(),));
            }).onError((error, stackTrace) {});
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),

      body: Center(
        child: Text("Welcome to South Africa"),
      ),
    );
  }
}