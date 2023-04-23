class Category {
  int? id;
  String? title;
  String? slug;
  int? chubien;

  Category({this.id, this.title, this.slug, this.chubien});

  Category.fromJson(Map<String, dynamic> json) {
    print(json['title']);
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    chubien = json['chubien'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['chubien'] = chubien;
    return data;
  }
}
