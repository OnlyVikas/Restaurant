import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orders/Model/cart_model.dart';
import 'package:orders/state/cart_state.dart';

class CartImageWidget extends StatelessWidget {
  const CartImageWidget({
    Key? key,
    required this.controller,
    required this.cartModel,
  }) : super(key: key);

  final CartStateController controller;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: cartModel.image,
      fit: BoxFit.cover,
      errorWidget: (context,url,err)=>
          Center(child: Icon(Icons.image),),
      progressIndicatorBuilder: (context, url, dowloadProgress) =>
          Center(child: CircularProgressIndicator(),
          ),
    );
  }
}