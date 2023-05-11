import 'package:news_ui/models/object/message.dart';
import 'package:news_ui/models/object/user.dart';

class UserModels extends Message {
  User? user;

  UserModels({super.success, super.message, this.user});

  UserModels.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
