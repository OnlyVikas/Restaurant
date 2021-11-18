

import 'package:orders/Model/category_model.dart';

abstract class CategoryViewModel{
  Future<List<CategoryModel>> displayCategoryByRestaurantId(String restaurantId);
}
