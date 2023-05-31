import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/models/object/message.dart';
import 'package:news_ui/models/response/user_models.dart';

class RequestUser {
  static String url = "$URL$URL_USER";

  Future<UserModels> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$url/login"),
      headers: <String, String>{
        'Content-Type': "application/x-www-form-urlencoded",
      },
      body: {'email': email, "password": password},
    );

    if (response.statusCode == 200) {
      return compute(_parseLogin, utf8.decode(response.bodyBytes));
    }
    throw Exception("Error Server");
  }

  static UserModels _parseLogin(String reponseBody) {
    UserModels userModels = UserModels.fromJson(jsonDecode(reponseBody));
    return userModels;
  }

  static Message _parseRegister(String reponseBody) {
    Message message = Message.fromJson(jsonDecode(reponseBody));
    return message;
  }

  Future<Message> register(
      String name, String email, String phone, String password) async {
    final response = await http.post(
      Uri.parse("$url/register"),
      headers: <String, String>{
        'Content-Type': "application/x-www-form-urlencoded",
      },
      body: {
        'email': email,
        "password": password,
        "phone": phone,
        "name": name
      },
    );

    if (response.statusCode == 200) {
      return compute(_parseRegister, utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Error Server");
    }
  }

  static Future<Message> forgetPassword(String email) async {
    final response = await http.post(
      Uri.parse("$url/forget-password"),
      headers: <String, String>{
        'Content-Type': "application/x-www-form-urlencoded",
      },
      body: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      return compute(_parseForget, utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Error Server");
    }
  }

  static Message _parseForget(String reponseBody) {
    Message message = Message.fromJson(jsonDecode(reponseBody));
    return message;
  }
}
