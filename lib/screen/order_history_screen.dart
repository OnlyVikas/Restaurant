import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/Model/order_model.dart';
import 'package:orders/String/main_sting.dart';
import 'package:orders/state/main_state.dart';
import 'package:orders/view-model/order_history_vm/order_history_vm_imp.dart';
import 'package:orders/widgets/order_history/order_history_list_widget.dart';

class OrderHistory extends StatelessWidget{
  final vm=new OrderHistoryViewModelImp();
  final MainStateController mainStateController=Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text(orderHistoryText),),
      body: FutureBuilder(
        future: vm.getUserHistory(mainStateController.selectedRestaurant.value.restaurantId),
        builder: ( context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator(),);
          else{
            var lst=snapshot.data as List<OrderModel>;
            return OrderHistoryListWidget(listOrder: lst);
          }
        },
      ),

    ));
  }

}