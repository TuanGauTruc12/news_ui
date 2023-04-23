import 'package:news_ui/models/object/category.dart';

class CategoryModels {
  bool? success;
  String? message;
  List<Category>? categories;

  CategoryModels({this.success, this.message, this.categories});

  CategoryModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
