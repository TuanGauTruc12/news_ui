class New {
  int? id;
  String? title;
  String? slug;
  String? summary;
  String? content;
  String? author;
  String? postingDate;
  String? approvalDate;
  int? view;
  String? image;
  String? video;
  bool? status;
  int? idProperty;
  int? idCategory;

  New(
      {this.id,
      this.title,
      this.slug,
      this.summary,
      this.content,
      this.author,
      this.postingDate,
      this.approvalDate,
      this.view,
      this.image,
      this.video,
      this.status,
      this.idProperty,
      this.idCategory});

  New.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    summary = json['summary'];
    content = json['content'];
    author = json['author'];
    postingDate = json['posting_date'];
    approvalDate = json['approval_date'];
    view = json['view'];
    image = json['image'];
    video = json['video'];
    status = json['status'];
    idProperty = json['id_property'];
    idCategory = json['id_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['summary'] = summary;
    data['content'] = content;
    data['author'] = author;
    data['posting_date'] = postingDate;
    data['approval_date'] = approvalDate;
    data['view'] = view;
    data['image'] = image;
    data['video'] = video;
    data['status'] = status;
    data['id_property'] = idProperty;
    data['id_category'] = idCategory;
    return data;
  }
}
