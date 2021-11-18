import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:orders/Model/cart_model.dart';
import 'package:orders/screen/place_order_screen.dart';
import 'package:orders/state/cart_state.dart';
import 'package:orders/state/main_state.dart';
import 'package:orders/view-model/cart_vm/cart_view_model.dart';
import 'package:orders/view-model/menu_vm/menu_viewmodel_imp.dart';

class CartViewModelImp implements CartViewModel{
  final MainStateController mainStateController=Get.find();
  final MenuViewModelImp menuViewModelImp=new MenuViewModelImp();

  void updateCart(CartStateController controller,String restaurantId,int index,int value){
    controller.cart.value= controller.getCart(restaurantId);
    controller.cart[index].quantity=value;
    controller.cart.refresh();
    controller.saveDatabase();
  }

  void deleteCart(CartStateController controller,String restaurantId,int index){
   controller.cart.value= controller.getCart(restaurantId);
   controller.cart.removeAt(index);
    controller.saveDatabase();
  }
  void clearCart(CartStateController controller){
    controller.clearCart(mainStateController.selectedRestaurant.value.restaurantId);
  }

  processCheckout(BuildContext context, List<CartModel> cart) {
    if(FirebaseAuth.instance.currentUser!=null){
      Get.to(()=>PlaceOrderScreen());
    }
    else{
      menuViewModelImp.login(context);
    }

  }
}