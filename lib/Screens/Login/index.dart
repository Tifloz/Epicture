import 'package:dev_epicture/Screens/Home/index.dart';
import 'package:dev_epicture/auth/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dev_epicture/globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    if (globals.username == null)
      return Container(
          child: Center(
              child: FlatButton(
        color: Colors.greenAccent,
        child: Text("Sign In"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Auth();
          }));
        },
      )));

    return HomeScreen();
  }

  @override
  void initState() {
    super.initState();
  }
}
