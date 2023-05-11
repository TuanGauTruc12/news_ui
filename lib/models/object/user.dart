class User {
  int? id;
  String? name;
  String? email;
  String? password;
  int? idRole;
  String? image;

  User(
      {this.id, this.name, this.email, this.password, this.idRole, this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    idRole = json['id_role'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['id_role'] = idRole;
    data['image'] = image;
    return data;
  }
}
