import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_ui/models/object/new-detail.dart';
import 'package:news_ui/models/object/new.dart';
import 'package:news_ui/models/response/new_models.dart';
import 'package:http/http.dart' as http;
import 'package:news_ui/apis/global.dart';

class RequestNew {
  static String url = "$URL$GET_NEWS/";

  static List<New> getNewByCategory(String reponseBody) {
    NewModels newModels = NewModels.fromJson(jsonDecode(reponseBody));
    late List<New> news = [];
    if (newModels.success == true && newModels.message == "successfully") {
      var list = json.decode(jsonEncode(newModels.news)) as List<dynamic>;
      news = list.map((model) => New.fromJson(model)).toList();
    }
    return news;
  }

  static NewDetail getNewBySlug(String reponseBody) {
    NewDetail newDetail = NewDetail.fromJson(jsonDecode(reponseBody));
    return newDetail;
  }

  static Future<List<New>> fetchNew(String slug) async {
    final response = await http.get(Uri.parse("${url}category=$slug"));

    if (response.statusCode == 200) {
      return compute(getNewByCategory, utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else {
      throw Exception('Can \'t not category');
    }
  }

  static Future<NewDetail> fetchNewDetail(String slug) async {
    final response = await http.get(Uri.parse('${url}slugNews=$slug'));
    if (response.statusCode == 200) {
      return compute(getNewBySlug, utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else {
      throw Exception('Can \'t not news');
    }
  }
}
