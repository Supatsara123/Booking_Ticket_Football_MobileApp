import 'package:buyticketfootball/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapchat){
          if (snapchat.hasData){
            debugPrint("You are login: as ${snapchat.data?.email.toString()}");
            return HomePage();
          }else{
            debugPrint("You are not login");
            return AuthPage();
          }
        },
      ),
    );
  }
}
