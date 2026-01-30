class CategoryEntity {
  final String id;
  final String name;
  final String images;
  final bool isActive;
  final DateTime createdAt;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.images,
    required this.isActive,
    required this.createdAt,
  });
}
