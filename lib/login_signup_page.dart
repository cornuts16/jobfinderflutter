import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toiletfinderflutter/auth_provider.dart';
import 'dart:async';
import 'auth.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class SignInDemo extends StatefulWidget {
  const SignInDemo({this.onSignedIn});
  final VoidCallback onSignedIn;


  @override
  _SignInDemoState createState() => _SignInDemoState();
}

enum FormType {
  login,
  register,
}

class _SignInDemoState extends State<SignInDemo> {


String email;
String pw;
String pwConfirm;

FormType formType = FormType.login;

final formKey = new GlobalKey<FormState>();

bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

 Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final BaseAuth auth = AuthProvider.of(context).auth;
        if (formType == FormType.login) {
          final String userId = await auth.signInWithEmailAndPassword(email, pw);
          print('Signed in: $userId');
        } else {
          final String userId = await auth.createUserWithEmailAndPassword(email, pw);
          print('Registered user: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

void moveToRegister(){
  formKey.currentState.reset();
  setState(() {
    formType = FormType.register;
  });
}

void moveToLogin(){
  formKey.currentState.reset();
  setState(() {
    formType = FormType.login;
  });
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
      child: Text("Login o Registrazione",
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
     body: new Padding (
  padding: const EdgeInsets.all(20),
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      new Form(
                key: formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
           children: buildInputs() + buildSubmitButtons(),

         ),
       ),
      ],
      ),
),
    );
  }


   List<Widget> buildInputs() {
    return <Widget>[
      TextFormField(
        key: Key('email'),
        decoration: InputDecoration(labelText: 'Email'),
        validator: EmailFieldValidator.validate,
        onSaved: (String value) => email = value,
      ),
      TextFormField(
        key: Key('password'),
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: PasswordFieldValidator.validate,
        onSaved: (String value) => pw = value,
      ),
      new Container(
        height: 20,
      )
    ];
  }

 List<Widget> buildSubmitButtons() {
    if (formType == FormType.login) {
      return <Widget>[
        RaisedButton(
          key: Key('signIn'),
          child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: validateAndSubmit,
        ),
        RaisedButton(
          child: Text('Create an account', style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        RaisedButton(
          child: Text('Create an account', style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: validateAndSubmit,
        ),
        RaisedButton(
          child: Text('Have an account? Login', style: TextStyle(fontWeight: FontWeight.bold)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
  
}

