import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
import 'package:timeago/timeago.dart' as timeago;

class HomePost extends StatefulWidget {
  @override
  _HomePostState createState() => _HomePostState();
}

class _HomePostState extends State<HomePost> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "posts";
  List<Post> postsList = <Post>[];


  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
       
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Visibility(
              visible: postsList.isEmpty,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

             Visibility(
                visible:  postsList.isNotEmpty,
                child: Flexible(
                  fit: FlexFit.loose,
                  
                  child: FirebaseAnimatedList(
                      query: _database.reference().child('posts'),
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
                      ),
                         Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   
                              new Text(postsList[index].body,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,),
                              
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                   
                              new Text(timeago.format(DateTime.fromMillisecondsSinceEpoch(postsList[index].date)),
                                    style: TextStyle(fontSize: 11),),
                              
                          
                                ],
                              ),
                              
                            ),
                            
                           
                          ],
                        ),
                    ],
                  ),
          ),
                );
                      }
                  ),
                ),
              
              ),
          ],
        ),
      ),
      
    );
  }

   _childAdded(Event event) {
    setState(() {
      postsList.add(Post.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedPost = postsList.singleWhere((post){
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList.removeAt(postsList.indexOf(deletedPost));
    });
  }

  void _childChanged(Event event) {
    var changedPost = postsList.singleWhere((post){
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList[postsList.indexOf(changedPost)] = Post.fromSnapshot(event.snapshot);
    });
  }
}