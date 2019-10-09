library project.globals;

import "package:shared_preferences/shared_preferences.dart";
import "dart:convert";

String clientId = "879e6d6718ce5cf";
String clientSecret = "08e75385589c45050ebd4e25062689d1b2e24c9f";

SharedPreferences prefs;

getPrefs(callback) async {
  prefs = await SharedPreferences.getInstance();
  callback();
}

dynamic get user {
  if (prefs == null) return null;
  var tmp = prefs.get("user");
  if (tmp == null) return null;
  var data = json.decode(tmp);
  data["createdAt"] = DateTime.parse(data["createdAt"]);
  return json.decode(tmp);
}

set user(tmp) {
  if (prefs != null) {
    var encoded = json.encode(tmp, toEncodable: (item) {
      if (item is DateTime) {
        return item.toIso8601String();
      }
      return item;
    });
    prefs.setString("user", encoded);
  }
}

String get userId => prefs?.get("userId");

set userId(String value) => prefs?.setString("userId", value);

String get accessToken => prefs?.get("accessToken");

set accessToken(String value) => prefs?.setString("accessToken", value);

String get refreshToken => prefs?.get("refreshToken");

set refreshToken(String value) => prefs?.setString("refreshToken", value);

String get username => prefs?.get("username");

set username(String value) => prefs?.setString("username", value);

int get expiresIn => prefs?.get("expiresIn");

set expiresIn(int value) => prefs?.setInt("expiresIn", value);

DateTime get  createdAt {
  var tmp = prefs?.get("createdAt");
  return DateTime.parse(tmp);
}
