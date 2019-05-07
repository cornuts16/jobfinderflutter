import 'package:flutter/material.dart';
import 'dart:ui';
 
class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
  body: new Stack(
    children: <Widget>[
      
      new Positioned(
        top: 0.0,
        left: 0.0,
        bottom: 0.0,
        right: 0.0,
        //here the body
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,

      children: <Widget>[
        
        Flexible(child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => index == 0 ? new SizedBox(
        //child: InstaStories(),
        height: 50,
      ) : Column(
       
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
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
                        "https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/55590182_2390701110949677_8951166926713782272_n.jpg?_nc_cat=108&_nc_ht=scontent-mxp1-1.xx&oh=2685f6e2e569f847d609b870d2a98bc6&oe=5D3A5179"),)
                  ),
                ),
                new SizedBox(
                  width: 10,
                ),
                new Text(
                  "Sisk", 
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
          ),
          Flexible(
            fit: FlexFit.loose,
            child: new Image.network("https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/14358742_10207559956862444_2859988370400494156_n.jpg?_nc_cat=109&_nc_ht=scontent-mxp1-1.xx&oh=0d013860c59f9a1bcc587671b52d211e&oe=5D2935FA",
            fit: BoxFit.cover,),
          )
        ],
      ),
    ),
    )
      ],
      ),
        ),
      
      new Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        //here the body
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          brightness: Brightness.light,
        title: Image.asset('assets/logo.png', 
          height: 30,
          fit: BoxFit.fitHeight,
          alignment: Alignment.center,
          ),
        elevation: 0,
        backgroundColor: Colors.blue.withOpacity(0.2),
      ),
        ),
        
      ),
    ],
  ),
);
  }
}