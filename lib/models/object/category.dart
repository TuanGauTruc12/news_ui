class Category {
  int? id;
  String? title;
  String? slug;
  int? chubien;
  String? imageCategory;

  Category({this.id, this.title, this.slug, this.chubien, this.imageCategory});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    chubien = json['chubien'];
    imageCategory = json['imageCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['chubien'] = chubien;
    data['imageCategory'] = imageCategory;
    return data;
  }
}
