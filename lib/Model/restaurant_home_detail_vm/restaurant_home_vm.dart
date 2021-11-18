import 'package:orders/Model/main_vm/popular_item_model.dart';

abstract class RestaurantHomeDetailViewModel{
  Future<List<PopularItemModel>>displayMostPopularByRestaurantId(String restaurantId);

  Future<List<PopularItemModel>>displayBestDealsByRestaurantId(String restaurantId);

}
