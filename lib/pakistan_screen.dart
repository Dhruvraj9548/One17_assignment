import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class PakistanScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("AppPAK"),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyScreen(),));
            }).onError((error, stackTrace) {});
          }, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Text("Welcome to Pakistan"),
      ),
    );
  }
}
