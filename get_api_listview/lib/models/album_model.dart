// Model: User
class User {
  // Properti yang menyimpan data user
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  // Konstruktor untuk membuat objek User
  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  // Fungsi factory untuk membuat objek User dari data JSON
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}
