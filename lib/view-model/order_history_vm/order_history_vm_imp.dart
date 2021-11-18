import 'package:orders/Firebase/order_refrence.dart';
import 'package:orders/Model/order_model.dart';
import 'order_history_vm.dart';

class OrderHistoryViewModelImp implements OrderHistoryViewModel{
  @override
  Future<List<OrderModel>> getUserHistory(String restaurantId) {
   return getUserOrdersByRestaurant(restaurantId);
  }

}