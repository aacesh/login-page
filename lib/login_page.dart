import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
  // => new _LoginPageState();

}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;

//validate and save saves value to _email and _password
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('form is valid , email = $_email , password = $_password');
      return true;
    } else {
      print('form is invalid');
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login){
        FirebaseUser firebaseUser = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        print('Signed in :${firebaseUser.uid}');
        } 
        else {
FirebaseUser firebaseUser = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(email: _email, password: _password))
            .user;
            print('Registered in :${firebaseUser.uid}');
        }
      } catch (e) {
        print("error is $e");
      }
    }
  }

  void moveToRegister() {
    //clear the data that is user and password on the screen
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveTologin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter login demo'),
      ),
      body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildInputs() + buildSubmitButtons(),
              ))),
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: "email"),
        validator: (value) => value.isEmpty ? 'email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: "password"),
        //obsecureText to not showing password
        obscureText: true,
        validator: (value) => value.isEmpty ? 'password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons(){

    if(_formType == FormType.login){
    return[
      new RaisedButton(
        child:
            new Text("login", style: new TextStyle(fontSize: 20)),
        onPressed: validateAndSubmit,
      ),
      new FlatButton(
        child: new Text('create an account',
            style: new TextStyle(fontSize: 20.0)),
        onPressed: moveToRegister,
      )
    ];
  }
  else{
     return[
      new RaisedButton(
        child:
            new Text("create an account", style: new TextStyle(fontSize: 20)),
        onPressed: validateAndSubmit,
      ),
      new FlatButton(
        child: new Text('have an account? login',
            style: new TextStyle(fontSize: 20.0)),
        onPressed: moveTologin,
              )
            ];
        
          }
          }
        
        
  
}
