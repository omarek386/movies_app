class UserEntity {
  final String email;
  final String name;
  final String password;

  UserEntity({
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  String toString() {
    return 'UserEntity(email: $email, name: $name, password: $password)';
  }
}
