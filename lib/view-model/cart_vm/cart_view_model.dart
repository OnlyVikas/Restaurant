import 'package:flutter/material.dart';
import 'package:orders/Model/cart_model.dart';
import 'package:orders/state/cart_state.dart';

abstract class CartViewModel{
  void updateCart(CartStateController controller,String restaurantId,int index,int value);
  void deleteCart(CartStateController controller,String restaurantId,int index);
  void clearCart(CartStateController controller);
  void processCheckout(BuildContext context, List<CartModel> cart);
}