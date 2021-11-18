import 'package:orders/Model/main_vm/restaurant_model.dart';

abstract class MainViewModel{
  Future<List<RestaurantModel>> displaygetRestaurantList();
}