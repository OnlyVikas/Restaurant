import 'package:orders/Model/food_model.dart';

class CartModel extends FoodModel{
  int quantity= 0;
  String restaurantId='';
  String userUid='';

  CartModel({description,
  id,
  name,
  image,
  price,
  size,
  addon,
  required this.quantity,required this.restaurantId,required this.userUid}):super(
    description:description,
    id:id,
    name:name,
    image:image,
    price:price,
    size:size,
    addon:addon,
  );

 factory CartModel.fromJson(Map<String,dynamic>json){
    final food=FoodModel.fromJson(json);
    final restaurantId= json['restaurantId'];
    final quantity=json['quantity'];
    final userUid=json['userUid'];
    return CartModel(
      userUid: userUid,
      restaurantId: restaurantId,
      quantity: quantity,
      id:food.id,
      name:food.name,
      image:food.image,
      price:food.price,
      size:food.size,
      addon:food.addon,
    );

  }
  Map<String,dynamic>toJson(){
    final data=Map<String,dynamic>();
    data ['description']=this.description;
    data ['id']=this.id;
    data ['name']=this.name;
    data ['image']=this.image;
    data ['price']=this.price;
    data['quantity']=this.quantity;
    data['restaurantId']=this.restaurantId;
    data['userUid']=this.userUid;
    data ['size']=this.size.map((v)=>v.toJson()).toList();
    data ['addon']=this.addon.map((v)=>v.toJson()).toList();

    return data;
  }

}