import 'package:firebase_auth/firebase_auth.dart';
import 'package:orders/Firebase/order_refrence.dart';
import 'package:orders/Firebase/server_time_offset_ref.dart';
import 'package:orders/Model/order_model.dart';
import 'package:orders/state/cart_state.dart';
import 'package:orders/utils/utils.dart';
import 'package:orders/view-model/process_order/process_order_vm.dart';

class ProcessOrderViewModelImp extends ProcessOrderViewModel{
  @override
  Future<bool> submitOrder(OrderModel orderModel) {
   return writeOrderToFirebase(orderModel);
  }

  @override
  Future<OrderModel> createOrderModel(
      {required String restaurantId,
      required double discount,
      required String firstName,
      required String lastName,
      required String address,
      required bool isCod,
      required String comment,
      required CartStateController cartStateController})
  async{
   var serverTime=await getServerTimeOffset();
   return new OrderModel(
       userId:FirebaseAuth.instance.currentUser!.uid,
       userName:'$firstName $lastName',
       userPhone:FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
       shippingAddress:address,
       comment:comment,
       orderNumber:createOrderNumber(serverTime).toString(),
       restaurantId:restaurantId,
       totalPayment:cartStateController.getSubTotal(restaurantId),
       finalPayment:calculateFinalPayment(cartStateController.getSubTotal(restaurantId), discount),
       shippingCost:cartStateController.getShippingFee(restaurantId),
       discount:discount,
       isCod:isCod,
       cartItemList:cartStateController.getCart(restaurantId),
       orderStatus:0,
       createdDate:serverTime);
  }


  
}