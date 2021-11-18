import 'package:orders/Model/order_model.dart';
import 'package:orders/state/cart_state.dart';

abstract class ProcessOrderViewModel{
  Future<bool>submitOrder(OrderModel orderModel);
  Future<OrderModel> createOrderModel(
      {required String restaurantId,
        required double discount,
        required String firstName,
        required String lastName,
        required String address,
        required bool isCod,
        required String comment,
        required CartStateController cartStateController});
}