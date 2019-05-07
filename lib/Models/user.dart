import 'package:firebase_database/firebase_database.dart';

class User {

  static const KEY = "key";
  static const SUBDATE = "subdate";
  static const NAME = "name";
  static const SURNAME = "surname";
  //static const BIRTH = "birth";
  static const EMAIL = "email";


  int subDate;
  String key;
  String name;
  String surname;
  String email;


  User(this.subDate, this.name, this.surname, this.email, );

/*
  String get key => _key;
  String get date => _date;
  String get title => _title;
  String get body => _body;
*/

  User.fromSnapshot(DataSnapshot snap):
        this.key = snap.key,
        this.subDate = snap.value[SUBDATE],
        this.name = snap.value[NAME],
        this.email = snap.value[EMAIL],
        this.surname = snap.value[SURNAME];
        
       
  Map toMap(){
    return {SUBDATE: subDate, NAME: name, SURNAME: surname,EMAIL: email, KEY: key};
  }
}