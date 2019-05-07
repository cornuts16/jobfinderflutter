//import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:toiletfinderflutter/Models/user.dart';
import 'auth.dart';


class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
FirebaseDatabase _database = FirebaseDatabase.instance;

  String nodeName = "users";

  List<User> userList = <User>[];

   @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
  }

  final topBar = new AppBar(
    iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 0,
    //leading: new Icon(Icons.camera_alt),
    title: SizedBox(
      height: 35,
      child: Text("Profilo",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 12),
        //child: new Icon(Icons.send),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: topBar,
     body: Container(
       child: Column(
         children: <Widget>[
            Container(
             // height: 60,
            ),
            Flexible(
                  fit: FlexFit.loose,
                  
                  child: FirebaseAnimatedList(
                      query: _database.reference().child('users'),
                      itemBuilder: (_, DataSnapshot snap, Animation<double> animation, int index){
                        return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[200],
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
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  userList[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                            
                          ],
                        ),

                      )
                    ],
                  ),
                            ),
                        );
                      }
                  ),
            ),
         ],
       ),
     ),
     
    );
  }

   _childAdded(Event event) {
    setState(() {
      userList.add(User.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedPost = userList.singleWhere((post){
      return post.key == event.snapshot.key;
    });

    setState(() {
      userList.removeAt(userList.indexOf(deletedPost));
    });
  }

  void _childChanged(Event event) {
    var changedPost = userList.singleWhere((post){
      return post.key == event.snapshot.key;
    });

    setState(() {
      userList[userList.indexOf(changedPost)] = User.fromSnapshot(event.snapshot);
    });
  }
}