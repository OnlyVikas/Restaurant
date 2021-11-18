import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:orders/String/cart_string.dart';
import 'package:orders/String/main_sting.dart';
import 'package:orders/screen/cart_screen.dart';
import 'package:orders/screen/category.dart';
import 'package:orders/screen/order_history_screen.dart';
import 'package:orders/screen/restaurant_home.dart';
import 'package:orders/state/cart_state.dart';
import 'package:orders/state/main_state.dart';
import 'package:orders/utils/const.dart';
import 'package:orders/view-model/menu_vm/menu_viewmodel.dart';

class MenuViewModelImp implements MenuViewModel{
  final cartState=Get.put(CartStateController());
  final mainState =Get.put(MainStateController());

  @override
  void navigateCategories() {

   Get.to(()=>CategoryScreen());
  }

  @override
  void backToRestaurantList() {
   Get.back(closeOverlays: true,canPop: false);
  }

  @override
  bool checkLoginState(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null ? true:false;
  }

  @override
  void login(BuildContext context) {
   var user =FirebaseAuth.instance.currentUser;
   if(user==null){
     FlutterAuthUi.startUi(items: [AuthUiProvider.phone],
         tosAndPrivacyPolicy: TosAndPrivacyPolicy(
           tosUrl:'https://google.com',
           privacyPolicyUrl:'https://youtube.com'),
       androidOption: AndroidOption(enableSmartLock: false,
       showLogo: true,
         overrideTheme: true
       )).then((value) async{
         navigationHome(context);
     }).catchError((e) {
       Get.snackbar('Error', '$e');
     });
   }
  }

  @override
  void logout(BuildContext context) {
    Get.defaultDialog(
      title: logoutTitle,
      content: Text(logoutText),
      backgroundColor: Colors.white,
      cancel: ElevatedButton(onPressed: ()=>Get.back(), child: Text(cancelText)),
      confirm: ElevatedButton(onPressed: (){
        FirebaseAuth.instance.
        signOut().then((value) => Get.offAll(RestaurantHome()));
      }, child: Text(confirmL,style: TextStyle(color: Colors.yellow),))
      
    );

  }

  @override
  void navigationHome(BuildContext context) async{
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    var box =GetStorage();
    //save token,use for notification
    box.write(KEY_TOKEN, token);
    //clone cart
    if(cartState.cart.length>0)//if not empty
      {
        var newCart=cartState.getCartAnonymous(mainState
            .selectedRestaurant.value.restaurantId);//remember anonymous
      cartState.mergeCart(
        newCart,mainState.selectedRestaurant.value.restaurantId);
      cartState.saveDatabase();//save
      print(jsonEncode(cartState.cart));
    }
    Get.offAll(()=>RestaurantHome());
  }



  @override
  void navigateCart()=>Get.to(()=>CartDetailScreen());

  @override
  void viewOrderHistory(BuildContext context) {
    Get.to(()=>OrderHistory());
  }


}