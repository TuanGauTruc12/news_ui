import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:news_ui/models/object/newlistview.dart';
import 'package:news_ui/models/response/new_models.dart';
import 'package:http/http.dart' as http;
import 'package:news_ui/apis/global.dart';

class RequestNew {
  static String url = "$URL$GET_NEWS/category=";

  static List<NewListView> getNewByCategory(String reponseBody) {
    NewModels newModels = NewModels.fromJson(jsonDecode(reponseBody));
    late List<NewListView> news = [];
    if (newModels.success == true && newModels.message == "successfully") {
      var list = json.decode(jsonEncode(newModels.news)) as List<dynamic>;
      news = list.map((model) => NewListView.fromJson(model)).toList();
    }
    return news;
  }

  static Future<List<NewListView>> fetchNew(String slug) async {
    final response = await http.get(Uri.parse(url + slug));
    if (response.statusCode == 200) {
      return compute(getNewByCategory, utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 404) {
      throw Exception("not found");
    } else {
      throw Exception('Can \'t not category');
    }
  }
}
