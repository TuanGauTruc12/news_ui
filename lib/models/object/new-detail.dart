import 'package:news_ui/models/object/comment.dart';
import 'package:news_ui/models/object/new.dart';

class NewDetail {
  bool? success;
  String? message;
  List<Comment>? comments;
  New? newDetail;

  NewDetail({this.success, this.message, this.comments, this.newDetail});

  NewDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['comments'] != null) {
      comments = <Comment>[];
      json['comments'].forEach((v) {
        comments!.add(Comment.fromJson(v));
      });
    }
    newDetail =
        json['newDetail'] != null ? New.fromJson(json['newDetail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (newDetail != null) {
      data['newDetail'] = newDetail!.toJson();
    }
    return data;
  }
}
