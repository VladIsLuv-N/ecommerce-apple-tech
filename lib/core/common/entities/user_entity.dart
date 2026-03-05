class UserEntity {
  final String userId;
  final String email;
  final String name;
  final String phoneNumber;
  final List<String> favorites;

  UserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.favorites,
  });
}
