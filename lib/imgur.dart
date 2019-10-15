import 'dart:convert';
import 'package:dev_epicture/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:developer' as developer;

class Imgur {
  static const endPoint = "https://api.imgur.com/3/";

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
    var uri = endPoint + "account/" + username;
    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());
    var data = json.decode(res.body)["data"];

    return data;
  }

  /*
    "avatar" variable in data
  */
  static getAvatar(username) async
  {
    var uri = endPoint + "account/" + username + "/images";
    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());
    var data = json.decode(res.body)["data"];

    return data;
  }

  static getAccountImages(username) async
  {
    var uri = endPoint + "account/" + username + "/images";
    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());
    var data = json.decode(res.body)["data"];

    return data;
  }

  static allGallery(username) async
  {
    var uri = endPoint + "account/" + username;

  }

  static getFavoriteGallery(username) async
  {
    var uri = endPoint + "account/" + username;

  }

  static searchGallery(username) async
  {
    var uri = endPoint + "account/" + username;

  }

  static uploadImage(username) async
  {
    var uri = endPoint + "account/" + username;

  }

}
