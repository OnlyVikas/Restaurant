import 'package:orders/Model/order_model.dart';

abstract class OrderHistoryViewModel{
  Future<List<OrderModel>>getUserHistory(String restaurantId);
}