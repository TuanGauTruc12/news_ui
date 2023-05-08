class Comment {
  String? content;
  String? commentDate;
  bool? status;
  int? idUser;
  int? idNew;

  Comment(
      {this.content, this.commentDate, this.status, this.idUser, this.idNew});

  Comment.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    commentDate = json['comment_date'];
    status = json['status'];
    idUser = json['id_user'];
    idNew = json['id_new'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['comment_date'] = commentDate;
    data['status'] = status;
    data['id_user'] = idUser;
    data['id_new'] = idNew;
    return data;
  }
}
