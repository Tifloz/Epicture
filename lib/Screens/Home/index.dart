import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/Form.dart';
import '../../Components/SignInButton.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return (new Scaffold(

          body: new Container(
              child: new Container(
                   decoration: new BoxDecoration(
                      color: Color.fromRGBO(40, 40, 40, 1),
                    ),
              )
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: new Icon(Icons.add, color: Colors.white),
              onPressed: () {},
              shape: new BeveledRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0)),
          ),

          bottomNavigationBar: BottomAppBar(
              notchMargin: 6.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.account_box),
                    onPressed: () {},
                  )
                ],
            ),
        ),
      )
    );
  }
}