import 'package:flutter/material.dart';
import 'package:toiletfinderflutter/home.dart';
import 'package:toiletfinderflutter/login_signup_page.dart';
import 'package:toiletfinderflutter/notification_page.dart';
import 'package:toiletfinderflutter/profile_page.dart';
import 'dart:ui';
import 'package:firebase_admob/firebase_admob.dart';
import 'auth.dart';
import 'login_signup_page.dart';
import 'auth_provider.dart';

class RootPage extends StatefulWidget {
RootPage({this.auth});
final BaseAuth auth;

  @override
  State<RootPage> createState() => RootPageState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}


class RootPageState extends State<RootPage> {
  
AuthStatus authStatus = AuthStatus.notDetermined;

 @override

void didChangeDependencies() {
    super.didChangeDependencies();
    final BaseAuth auth = AuthProvider.of(context).auth;
    auth.currentUser().then((String userId) {
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }
  
 void signedIn(){
   setState(() {
     authStatus = AuthStatus.signedIn;
   });
 }

 void signedOut(){
   setState(() {
     authStatus = AuthStatus.notSignedIn;
   });
 }

  @override
  Widget build(BuildContext context) {
    
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        
        return new SignInDemo(
          onSignedIn: signedIn,);
      
      case AuthStatus.signedIn:
        return new Home(
          onSignedOut: signedOut,
    );
    }
    return null;
  }
    Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}





