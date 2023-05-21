import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_ui/apis/global.dart';
import 'package:news_ui/models/object/comment.dart';
import 'package:news_ui/models/object/message.dart';
import 'package:news_ui/models/response/comment_models.dart';

class RequestComment {
  static String url = "$URL$URL_COMMENT";

  static Future<Message> sendComment(
      String contentComment, String dateComment, int idNew, int idUser) async {
    final response = await http.post(
      Uri.parse("$url/"),
      headers: <String, String>{
        'Content-Type': "application/x-www-form-urlencoded",
      },
      body: {
        'contentComment': contentComment,
        "dateComment": dateComment,
        "idNew": '$idNew',
        "idUser": '$idUser'
      },
    );

    if (response.statusCode == 200) {
      return compute(parseSendComment, utf8.decode(response.bodyBytes));
    }
    throw Exception("Error Server");
  }

  static Message parseSendComment(String reponseBody) {
    Message userModels = Message.fromJson(jsonDecode(reponseBody));
    return userModels;
  }

  static List<Comment> parseComment(String reponseBody) {
    CommentModels categoryModels =
        CommentModels.fromJson(jsonDecode(reponseBody));

    late List<Comment> categories = [];
    if (categoryModels.success == true &&
        categoryModels.message == "successfully") {
      var list =
          json.decode(jsonEncode(categoryModels.comments)) as List<dynamic>;
      categories = list.map((model) => Comment.fromJson(model)).toList();
    }
    return categories;
  }

  static Future<List<Comment>> fetchComment(String slugNew) async {
    final response = await http.get(Uri.parse('$url/slug=$slugNew'));
    if (response.statusCode == 200) {
      return compute(parseComment, utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 404) {
      throw Exception("not found");
    } else {
      throw Exception('Can \'t not category');
    }
  }
}
