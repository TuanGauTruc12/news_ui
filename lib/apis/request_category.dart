import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/object/category.dart' as category;
import 'package:http/http.dart' as http;
import 'package:news_ui/models/response/category_models.dart';
import 'package:news_ui/apis/global.dart';

class RequestCategory {
  static String url = "$URL$GET_CATEGORY/";
  static List<category.Category> parseCategory(String reponseBody) {
    CategoryModels categoryModels =
        CategoryModels.fromJson(jsonDecode(reponseBody));

    late List<category.Category> categories = [];
    if (categoryModels.success == true &&
        categoryModels.message == "successfully") {
      var list =
          json.decode(jsonEncode(categoryModels.categories)) as List<dynamic>;
      categories =
          list.map((model) => category.Category.fromJson(model)).toList();
    }
    return categories;
  }

  static Future<List<category.Category>> fetchCategory() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parseCategory, utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 404) {
      throw Exception("not found");
    } else {
      throw Exception('Can \'t not posts');
    }
  }
}
