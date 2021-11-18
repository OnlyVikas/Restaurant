
import 'package:orders/Firebase/category_refrence.dart';
import 'package:orders/Model/category_model.dart';

import 'category_viewmodel.dart';

class CategoryViewModelImp implements CategoryViewModel{
  @override
  Future<List<CategoryModel>> displayCategoryByRestaurantId(String restaurantId) {
   return getCategoryByRestaurantId(restaurantId);
  }

}

