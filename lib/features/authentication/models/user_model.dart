class UserModel {
  final String? id;
  final String name;
  final String surname;

  UserModel({ this.id, required this.name, required this.surname});

  toJson() {
    return {
      "Name": name,
      "Surname": surname
    };
  }
}