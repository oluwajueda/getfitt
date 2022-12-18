class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userRole;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.userRole});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'userRole': userRole
    };
  }
}
