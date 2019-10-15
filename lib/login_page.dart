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
      @override
      Widget build(BuildContext context) {
    
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('flutter login demo'),
          ),
          body: new Container(
            child: new Text('hello  world'),
          ),
        );
      }
  }

  
  
    
    
    
    


