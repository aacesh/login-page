import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
  // => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  void validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('form is valid , email = $_email , password = $_password');
    } else {
      print('form is invalid');
    }
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
            children: <Widget>[
              new TextFormField(
                  decoration: new InputDecoration(labelText: "email"),
                  validator: (value) =>
                      value.isEmpty ? 'email can\'t be empty' : null,
                      onSaved: (value) => _email = value,
                      ),
                      
              new TextFormField(
                  decoration: new InputDecoration(labelText: "password"),
                  //obsecureText to not showing password
                  obscureText: true,
                  validator: (value) =>
                      value.isEmpty ? 'password can\'t be empty' : null,
                      onSaved: (value) => _password = value,
                      
                      ),
              new RaisedButton(
                child: new Text("login", style: new TextStyle(fontSize: 20)),
                onPressed: validateAndSave,
              )
            ],
          ))),
    );
  }
}
