import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Page/home_Uplan.dart';
import 'Page/masuk.dart';

class Navigasi extends StatelessWidget {
  const Navigasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if(snapshot.hasData) {
            return HomeUPlan();
          } else if(snapshot.hasError){
            return Center(child: Text("Jang jang error"));
          }else {
            return Masuk();
          }

        },
      ),
    );
  }
}
