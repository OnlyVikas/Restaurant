import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:orders/String/main_sting.dart';
import 'package:orders/String/restaurant_home_string.dart';
import 'package:orders/const/const.dart';
import 'package:orders/view-model/menu_vm/menu_viewmodel_imp.dart';
import 'package:orders/widgets/menu/categories_menu_widget.dart';
import 'package:orders/widgets/menu/home_menu_widget.dart';
import 'package:orders/widgets/menu/menu_widget_callback.dart';



class MenuScreen extends StatelessWidget{
 final ZoomDrawerController zoomDrawerController;
 final viewModel =MenuViewModelImp();

 MenuScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Color(COLOR_MENU_BG),
  body: SafeArea(child: Column(children: [
    Row(children:
    [DrawerHeader(child: Column(children: [Container(margin: const EdgeInsets.only(left: 40),
  child:CircleAvatar(maxRadius: 40,backgroundColor: Color(COLOR_ICON_DRAWER),
  child: Icon(Icons.restaurant,color: Colors.white,size: 40,),
  ) ,
  )],))],),
  Divider(
    thickness: 1,),
    HomeMenuWidget(zoomDrawerController: zoomDrawerController),
    Divider(
      thickness: 1,),
    MenuWidget(icon:
    Icons.restaurant_rounded,menuName: restaurantListText,callback: viewModel.backToRestaurantList,),
    Divider(
      thickness: 1,),
    MenuWidget(icon:
    Icons.list,menuName: categoriesText,callback: viewModel.navigateCategories,),
    Divider(
      thickness: 1,),
    MenuWidget(icon:
    Icons.shopping_cart_rounded,menuName: cartText,callback: viewModel.navigateCart,),
    Divider(
      thickness: 1,),
    MenuWidgetCallback(
      icon:Icons.history,
      menuName: orderHistoryText,
      callback: viewModel.checkLoginState(context) ?
      viewModel.viewOrderHistory :viewModel.login  ,
    ),
    Divider(
      thickness: 1,),
    Spacer(),
    Divider(
      thickness: 1,),
    MenuWidgetCallback(

      icon:viewModel.checkLoginState(context)?
      Icons.logout :Icons.login,
      menuName: viewModel.checkLoginState(context) ? confirmL:loginText,
      callback: viewModel.checkLoginState(context) ?
      viewModel.logout
         :viewModel.login  ,
  ),
    Divider(
      thickness: 1,),

  ],),),
);
  }


}





