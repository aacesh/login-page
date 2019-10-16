import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

    @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
      }
  // => new _LoginPageState();
   
}
class _LoginPageState extends State<LoginPage> {

      String _email;
      String _password;
      void validateAndSave() {
        
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
            child :Column(children: <Widget>[
              new TextFormField(
                decoration: new  InputDecoration(labelText: "email"),
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: "password"),
                //obsecureText to not showing password
                obscureText: true,
              ),
              new RaisedButton(
                child: new Text("login" ,style: new TextStyle(fontSize: 20 )),
                onPressed: validateAndSave,
                              )
                            ],)
                            )
                          ),
                        );
                      }
                  
 
}

  
  
    
    
    
    


