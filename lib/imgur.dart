import 'dart:convert';
import 'package:dev_epicture/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:developer' as developer;

class Imgur {
  static const globalEndpoint = "https://api.imgur.com/3/";

  static getHeaders() {
    Map<String, String> header = {};
    if (globals.accessToken != null) {
      header["Authorization"] = "Bearer " + globals.accessToken;
    } else {
      header["Authorization"] = "Client-ID " + globals.clientId;
    }

    return header;
  }

  static getToken() async {
    var uri = "https://api.imgur.com/oauth2/token";
    var data = {
      "refresh_token": globals.refreshToken,
      "client_id": globals.clientId,
      "client_secret": globals.clientSecret,
      "grant_type": "refresh_token"
    };

    var res = await http.post(Uri.encodeFull(uri),
        headers: Imgur.getHeaders(), body: data);
    developer.log(json.decode(res.body));
    return json.decode(res.body);
  }

  static getAccount(username) async {
    var uri = globalEndpoint + "account/" + username;

    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());

    var data = json.decode(res.body)["data"];
    data["createdAt"] =
        new DateTime.fromMillisecondsSinceEpoch(data["created"] * 1000);
    return data;
  }
}
