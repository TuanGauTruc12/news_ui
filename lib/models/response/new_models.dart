import 'package:news_ui/models/object/new.dart';

class NewModels {
  bool? success;
  String? message;
  List<New>? news;

  NewModels({this.success, this.message, this.news});

  NewModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['news'] != null) {
      news = <New>[];
      json['news'].forEach((v) {
        news!.add(New.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
