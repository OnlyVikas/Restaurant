import 'package:orders/Firebase/restaurant_refrence.dart';
import 'package:orders/Model/main_vm/restaurant_model.dart';
import 'package:orders/view-model/main_view_model.dart';

class MainViewModelImp implements MainViewModel{
  @override
  Future<List<RestaurantModel>> displaygetRestaurantList() {
    return getRestaurantList();
  }

}

