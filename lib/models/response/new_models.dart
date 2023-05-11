import 'package:news_ui/models/object/message.dart';
import 'package:news_ui/models/object/new.dart';

class NewModels extends Message {
  List<New>? news;

  NewModels({super.success, super.message, this.news});

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

  @override
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
