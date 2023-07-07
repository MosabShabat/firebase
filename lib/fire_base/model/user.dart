class User {
  String? id;
  late String name;
  late String email;
  late String password;
  User(
      {this.id,
      required this.name,
      required this.email,
      required this.password});
  User.fromJson(Map map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return "$name ,  $email , $password , $id";
  }
}
