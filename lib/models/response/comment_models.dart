import 'package:news_ui/models/object/comment.dart';
import 'package:news_ui/models/object/message.dart';

class CommentModels extends Message {
  List<Comment>? comments;

  CommentModels({super.success, super.message, this.comments});

  CommentModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['comments'] != null) {
      comments = <Comment>[];
      json['comments'].forEach((v) {
        comments!.add(Comment.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
