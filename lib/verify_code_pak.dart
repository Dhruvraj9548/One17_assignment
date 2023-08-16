import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one17_techass/main.dart';
import 'package:one17_techass/pakistan_screen.dart';

class verifyCodeScreenPak extends StatefulWidget {

  final String verificationId;
  const verifyCodeScreenPak({Key? key, required this.verificationId}): super(key:key);

  @override
  State<verifyCodeScreenPak> createState() => _verifyCodeScreenPakState();
}

class _verifyCodeScreenPakState extends State<verifyCodeScreenPak> {
  final verificationCodeController = TextEditingController();

  final auth = FirebaseAuth.instance;


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
              controller: verificationCodeController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{

                final credential = PhoneAuthProvider.credential(verificationId: widget.verificationId,
                    smsCode: verificationCodeController.text.toString());

                try{
                  await auth.signInWithCredential(credential);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PakistanScreen(),));

                }catch(e){
                }

              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
