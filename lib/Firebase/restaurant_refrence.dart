import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:orders/Model/main_vm/restaurant_model.dart';
import 'package:orders/const/const.dart';

Future<List<RestaurantModel>>getRestaurantList()async{
  var list=List<RestaurantModel>.empty(growable: true);
  var source=await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).once();
  Map<dynamic,dynamic>values=source.value;
  RestaurantModel? restaurantmodel;
  values.forEach((key, value) {restaurantmodel=RestaurantModel.fromJson(jsonDecode(jsonEncode(value)));
  restaurantmodel!.restaurantId =key;
  list.add(restaurantmodel!);
  });
return list;
}