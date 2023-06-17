
import 'package:buyticketfootball/pages/login_page.dart';
import 'package:buyticketfootball/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // intially, show the login page
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      debugPrint("state=${showLoginPage.toString()}");
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(showRegisterPage: toggleScreens);
    }else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}