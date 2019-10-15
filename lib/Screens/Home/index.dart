import 'package:dev_epicture/Components/ImageCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

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

          /* =============== TOP APP BAR ========================= */

          appBar: AppBar(

            title: Text("Instapic", style: TextStyle(color: Colors.black)),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 50.0,
          ),

          /* =============== END TOP APP BAR ===================== */

          /* =============== BODY ================================ */

          body: new Container(
              child: new Container(
                   decoration: new BoxDecoration(
                      color: Color.fromRGBO(40, 40, 40, 1),
                    ),
                    child: new ListView(
                      children: <Widget>[

                            new ImageCard(
                              image:  DecorationImage(
                                image: new NetworkImage("https://www.pnglot.com/pngfile/detail/421-4216440_287-kb-png-fairy-tail-natsu-chibi.png"),
                                fit: BoxFit.fitWidth
                              )
                            ),

                            new ImageCard(
                              image:  DecorationImage(
                                image: new NetworkImage("https://www.pnglot.com/pngfile/detail/421-4216440_287-kb-png-fairy-tail-natsu-chibi.png"),
                                fit: BoxFit.fitWidth
                              )
                            ),

                            new ImageCard(
                              image:  DecorationImage(
                                image: new NetworkImage("https://www.pnglot.com/pngfile/detail/421-4216440_287-kb-png-fairy-tail-natsu-chibi.png"),
                                fit: BoxFit.fitWidth
                              )
                            ),

                      ]
                    ),
              )
          ),

          /* =============== END BODY ============================ */

          /* =============== BOTTOM NAVIGATION BAR =============== */

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

        /* =============== END BOTTOM NAVIGATION BAR =============== */


      )
    );
  }
}