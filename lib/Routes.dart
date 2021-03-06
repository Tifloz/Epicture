import 'package:dev_epicture/Screens/Home/index.dart';
import 'package:dev_epicture/Screens/Login/index.dart';
import 'package:flutter/material.dart';
import 'package:dev_epicture/auth/Auth.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      home: new LoginScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => new LoginScreen(),
              settings: settings,
            );

          case '/auth':
            return new MyCustomRoute(
              builder: (_) => new Auth(),
              settings: settings,
            );
          case '/home':
            return new MyCustomRoute(
              builder: (_) => new HomeScreen(),
              settings: settings,
            );
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
