class User {
  int? id;
  String? name;
  String? email;
  String? password;
  int? idRole;
  String? mobile;
  String? emailAccuracy;
  String? image;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.idRole,
      this.mobile,
      this.emailAccuracy,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    idRole = json['id_role'];
    mobile = json['mobile'];
    emailAccuracy = json['email_accuracy'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['id_role'] = idRole;
    data['mobile'] = mobile;
    data['email_accuracy'] = emailAccuracy;
    data['image'] = image;
    return data;
  }
}
