import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toiletfinderflutter/Models/post.dart';
import 'package:toiletfinderflutter/add_post.dart';
import 'package:toiletfinderflutter/home.dart';
import 'package:toiletfinderflutter/login_signup_page.dart';
import 'package:toiletfinderflutter/notification_page.dart';
import 'package:toiletfinderflutter/profile_page.dart';
import 'dart:ui';
import 'package:firebase_admob/firebase_admob.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'auth.dart';
import 'login_signup_page.dart';
import 'auth_provider.dart';
import 'home_post.dart';

class Home extends StatelessWidget {
  Home({this.onSignedOut});
  final VoidCallback onSignedOut;
  
   Future<void> signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }






  @override
  Widget build(BuildContext context) {


/*
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-7741512286979104~7882866165").then((response){
       myBanner ..load()
       //..show(
    //anchorOffset: 50.0,
    //anchorType: AnchorType.bottom,
      // )
      ; 
       }
     );
*/


    final topBar = PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: new AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Image.asset(
              'assets/logo.png',
              height: 30,
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
            //leading: 
            actions: <Widget>[
              new FlatButton(
          //color: Colors.red,
          //icon: Icon(Icons.add_a_photo), 
          child: Text('Log Out'),
              onPressed: () => signOut(context),
            ),
            ],
            elevation: 0,
            backgroundColor: Colors.white.withOpacity(0.6),
            brightness: Brightness.light,
          )),
    );

    var homeColumn = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) => index == 0
                ? new SizedBox(
                    //child: InstaStories(),
                    height: 60,
                  )
                : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
            offset: Offset(
              0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          )
        ],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 8, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                new Container(
                                  height: 40,
                                  width: 40,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            "https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/57251188_2423793120973809_7801523487176130560_o.jpg?_nc_cat=101&_nc_ht=scontent-mxp1-1.xx&oh=f20cb121dfa7f35821fc5a0be6fbca54&oe=5D38463B"),
                                      )),
                                ),
                                new SizedBox(
                                  width: 10,
                                ),
                                new Text(
                                  "Sisk Boss",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            new IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: null,
                            )
                          ],
                        ),
                      ),//fit: FlexFit.loose,
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   
                              new Text("Lavoro:",
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                              
                                    
                              new Text("Influencer",
                                    style: TextStyle(fontWeight: FontWeight.bold),),

                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   
                              new Text("Localita':",
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                              
                                    
                              new Text("Padova",
                                    style: TextStyle(fontWeight: FontWeight.bold),),

                                ],
                              ),
                              
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   
                              new Text("Stipendio:",
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                              
                                    
                              new Text("9999€",
                                    style: TextStyle(fontWeight: FontWeight.bold),),

                                ],
                              ),
                              
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   
                              new Text("Disponibilita':",
                                    style: TextStyle(fontWeight: FontWeight.bold),),
                              
                                    
                              new Text("Immediata",
                                    style: TextStyle(fontWeight: FontWeight.bold),),

                                ],
                              ),
                              
                            ),
                            
                           
                          ],
                        ),
                    ],
                  ),
          ),
                ),
          ),
        )
      ],
    );

    var bottomMenu = new Container(
      color: Colors.transparent,
      height: 50,
      alignment: Alignment.center,
      child: new BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new IconButton(
              highlightColor: Colors.transparent,
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            new IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPost()),
                );},
            ),
            new IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
            new IconButton(
              icon: Icon(Icons.contacts),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            )
          ],
        ),
      ),
    );

    return new Scaffold(
      bottomNavigationBar: bottomMenu,
      body: Stack(
        children: <Widget>[
          new Positioned(
            top: 0.0,
            left: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: HomePost(),
          ),
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: topBar,
          ),
        ],
      ),
    );
  }
}


BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  //targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

