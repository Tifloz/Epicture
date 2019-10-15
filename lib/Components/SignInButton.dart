import 'package:dev_epicture/auth/Auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn();
  @override
  Widget build(BuildContext context) {
    return (new GestureDetector(
        onTap: () {
          return Auth();
        },
        child: Container(
          width: 320.0,
          height: 60.0,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: const Color.fromRGBO(200, 20, 20, 1.0),
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: new Text(
            "Sign In",
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3,
            ),
          ),
        )));
  }
}
