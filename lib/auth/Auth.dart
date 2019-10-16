import 'dart:io';

import 'package:dev_epicture/imgur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:dev_epicture/globals.dart' as globals;
import 'dart:developer' as developer;

class AuthState extends State<Auth> {
  TextEditingController textEditingController;
  FlutterWebviewPlugin flutterWebviewPlugin = new FlutterWebviewPlugin();
  var _listener;
  static final uri = "https://api.imgur.com/oauth2/authorize";
  static final responseUri = "https://app.getpostman.com/oauth2/callback#";

  @override
  Widget build(BuildContext context) {
    String uri =
        AuthState.uri + "?client_id=${globals.clientId}&response_type=token";
    return WebviewScaffold(
        clearCache: false,
        clearCookies: false,
        appBar: AppBar(title: Text("Auth")),
        url: uri,
        withZoom: false);
  }

  getParams(String url) {
    var response = {};
    var params = url.substring(AuthState.responseUri.length);

    for (var param in params.split("&")) {
      var values = param.split("=");

      response[values[0]] = values[1];
    }
    return response;
  }

  close() async {
    var res = await flutterWebviewPlugin.close();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    this._listener = this
        .flutterWebviewPlugin
        .onStateChanged
        .listen((WebViewStateChanged state) async {
      var url = state.url;
      RegExp exp = new RegExp(responseUri);

      if (exp.hasMatch(url)) {
        var params = getParams(url);
        stderr.writeln("C'est FIX BTARD");

        setState(() {
          stderr.writeln("J'suis dans l'game négro");

          globals.accessToken = params["access_token"];
          globals.refreshToken = params["refresh_token"];
          globals.username = params["account_username"];
          globals.userId = params["account_id"];
          globals.expiresIn = int.parse(params["expires_in"]);
          stderr.writeln("Toujours làààà");
        });
        var tmp = await Imgur.getAccount("user");
        setState(() {
          globals.user = tmp;
        });
/*        var avatar = await Imgur.getAvatar("me");
        setState(() {
          globals.user["avatar"] = avatar["avatar"];
        });*/
        close();
        Navigator.pushReplacementNamed(context, "/home");
      }
    });
  }

  @override
  void dispose() {
    _listener.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  AuthState createState() => new AuthState();
}
