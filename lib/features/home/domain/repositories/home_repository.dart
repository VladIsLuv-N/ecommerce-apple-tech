import 'package:ecommerce_apple_tech_app/features/home/domain/entities/category_entity.dart';

abstract class HomeRepository {
  Future<List<CategoryEntity>> getCategories();
}
