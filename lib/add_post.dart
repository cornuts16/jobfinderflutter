//import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toiletfinderflutter/Database/post_service.dart';
import 'auth.dart';
import 'Models/post.dart';
import 'package:flutter/cupertino.dart';



class AddPost extends StatefulWidget {

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
 
 final GlobalKey<FormState> formkey = new GlobalKey();
  Post post = Post(0, " ", " ");


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
      child: Text("Scrivi un Post",
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
     body: Form(
       key: formkey,
       child: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 10,
          ),
         Text("A cosa stai pensando?"),
      TextFormField(
        //key: Key('password'),
        decoration: InputDecoration(labelText: 'Post'),
        //obscureText: true,
        validator: (val){
                    if(val.isEmpty){
                      return "Post non puo' essere vuoto";
                    }
                    else if(val.length > 140){
                      return "non piu' di 1/40 caratteri";
                    }
                  },
        onSaved: (val) => post.body = val,
      ),
      new Container(
        height: 20,
      ),
      RaisedButton(
          child: Text('Pubblica', style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: (){
        insertPost();
        
//        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
                  ),
                  ],
                  ),
               ),
     ) 
               
              );
            }
          
            void insertPost() {
    final FormState form = formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post.toMap());
      postService.addPost();
      Navigator.pop(context);
    }
  }
}