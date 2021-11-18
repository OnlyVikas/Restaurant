

import 'package:orders/Firebase/best_deals_refrence.dart';
import 'package:orders/Firebase/popular_refrence.dart';
import 'package:orders/Model/main_vm/popular_item_model.dart';
import 'package:orders/Model/restaurant_home_detail_vm/restaurant_home_vm.dart';

class RestaurantHomeDetailViewModelImp implements RestaurantHomeDetailViewModel{
  @override
  Future<List<PopularItemModel>> displayMostPopularByRestaurantId(String restaurantId) {
    return getMostPopularByRestaurantId(restaurantId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealsByRestaurantId(String restaurantId) {
    return getBestDealByRestaurantId(restaurantId);
  }


  
}