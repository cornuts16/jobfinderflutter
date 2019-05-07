import 'dart:async';
import 'package:toiletfinderflutter/home.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:toiletfinderflutter/profile_page.dart';
import 'login_signup_page.dart';
import 'auth.dart';
import 'auth_provider.dart';
import 'root_page.dart';


void main() => { 
  //Admob.initialize("ca-app-pub-7741512286979104~9377249969"),
  runApp(MyApp())};

class MyApp extends StatelessWidget {
 
  @override
  
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
    child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      
      title: 'Job Finder Flutter',
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    ),
    );
  }
}

  

MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
    keywords: <String>['games', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    //birthday: DateTime.now(),
    childDirected: false,
    //designedForFamilies: false,
    //gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[],                     
  );

  BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);