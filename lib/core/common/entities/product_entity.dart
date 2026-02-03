class ProductEntity {
  final String id;
  final String name;
  final String description;
  final String category;
  final List<String> images;
  final Map<String, dynamic> specification;
  final bool isAvailable;
  final double price;
  final double rating;
  final int reviewsCount;
  final int stock;
  final List<String> tags;
  final DateTime createdAt;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.images,
    required this.specification,
    required this.isAvailable,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.stock,
    required this.tags,
    required this.createdAt,
  });
}
