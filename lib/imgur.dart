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
  static getAvatar(username) async {
    var uri = endPoint + "account/" + username + "/images";
    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());
    var data = json.decode(res.body)["data"];

    return data;
  }

  static getAccountImages(username) async {
    var uri = endPoint + "account/" + username + "/images";
    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());
    var data = json.decode(res.body)["data"];

    return data;
  }

  static allGallery(username) async {
    var uri = endPoint + "account/" + username;
  }

  static getFavoriteGallery(
      {String username, int page = 0, String sort = "newest"}) async {
    var uri = endPoint + "account/$username/gallery_favorites/$page/$sort";
    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());

    return await json.decode(res.body)["data"];
  }

  static createAlbum(title, description, privacy) async {
    var url = endPoint + "album";

    var response = await http.post(url,
        headers: Imgur.getHeaders(),
        body: {"title": title, "description": description, "privacy": privacy});
    return await json.decode(response.body);
  }

  static searchGallery({String search = "", int page = 0}) async {
    var uri = endPoint +
        "gallery/search/time/all/" +
        page.toString() +
        "?q=" +
        search;
    var res = await http.get(Uri.encodeFull(uri), headers: Imgur.getHeaders());

    return json.decode(res.body)["data"];
  }

  static uploadImage(title, description, File image, privacy) async {
    var url = endPoint + "image";
    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    var response = await http.post(url, headers: Imgur.getHeaders(), body: {
      "title": title,
      "description": description,
      "image": base64Image,
      "privacy": privacy
    });
    return await json.decode(response.body);
  }
}
