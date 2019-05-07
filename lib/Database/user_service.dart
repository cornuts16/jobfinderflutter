import 'package:firebase_database/firebase_database.dart';
import 'package:toiletfinderflutter/Models/post.dart';
import 'package:toiletfinderflutter/Models/user.dart';

class UserService {
  String nodeName = "users";
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;

Map users;
UserService(this.users);

  addUser(){
   database.reference().child(nodeName).push().set(users);
  }

  deleteUser(){
    database.reference().child('$nodeName/${users['key']}').remove();
  }

  updateUser(){
    database.reference().child('$nodeName/${users['key']}').update(
      {"name": users['name'], "surname": users['surname'], "subdate":users['subdate'], "email":users['email']}
    );
  }

}