import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orders/Model/cart_model.dart';
import 'package:orders/state/cart_state.dart';
import 'package:orders/utils/utils.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(cartModel.name,
              style: GoogleFonts.jetBrainsMono(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:MainAxisAlignment.start ,
              children: [
                Icon(Icons.monetization_on,color: Colors.grey,size: 16,),
                SizedBox(width: 4,),
                Text('${currencyFormat.format(cartModel.price)}',
                  style: GoogleFonts.jetBrainsMono(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,)],
            ),
          )
        ],

      ),
    );
  }
}