import 'package:get/get.dart';
import 'package:orders/Model/main_vm/restaurant_model.dart';

class MainStateController extends GetxController{
  var selectedRestaurant=RestaurantModel(
      address: 'address',
      name: 'name',
      imageUrl: 'imageUrl',
      paymentUrl: 'paymentUrl',
      phone: 'phone').obs;
}