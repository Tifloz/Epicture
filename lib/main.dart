
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:dev_epicture/Routes.dart';

void main() {
  new Routes();
}


class User {
  final int id;
  final String title;
  final String body;

  User({this.id, this.title, this.body});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class ApiCall {
  final int type;

  ApiCall(this.type);
}

class PostCall {}
