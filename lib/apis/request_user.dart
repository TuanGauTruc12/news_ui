import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_ui/apis/global.dart';
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
      return compute(parseLogin, utf8.decode(response.bodyBytes));
    }
    throw Exception("Error Server");
  }

  static UserModels parseLogin(String reponseBody) {
    UserModels userModels = UserModels.fromJson(jsonDecode(reponseBody));
    return userModels;
  }
}
