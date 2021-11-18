import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orders/Model/restaurant_home_detail_vm/restaurant_home_vm.dart';
import 'package:orders/Model/restaurant_home_detail_vm/restaurant_home_detail_vm_imp.dart';

import 'package:orders/state/main_state.dart';
import 'package:orders/widgets/restaurant_home_detail/best_deal_widget.dart';
import 'package:orders/widgets/restaurant_home_detail/most_popular_widget.dart';


class RestaurantHomeDetail extends StatelessWidget{
  final MainStateController mainStateController=Get.find();
  final RestaurantHomeDetailViewModel viewModel=RestaurantHomeDetailViewModelImp();
  final ZoomDrawerController zoomDrawerController;


  RestaurantHomeDetail(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text('${mainStateController.selectedRestaurant.value.name}',
        style: GoogleFonts.jetBrainsMono(color: Colors.black,fontWeight: FontWeight.w900,)),
      backgroundColor:Colors.white ,
      foregroundColor: Colors.black,
      elevation: 10,
      iconTheme: IconThemeData(
          color: Colors.black),
      leading: InkWell(child: Icon(Icons.view_headline),onTap: ()=>zoomDrawerController.toggle!(),),

    ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [Expanded(flex: 1,
            child: MostPopularWidget(viewModel: viewModel, mainStateController: mainStateController),),
            Expanded(flex: 2,child:
            BestDealsWidget(viewModel: viewModel, mainStateController: mainStateController),),
          ],
        ),
      ),
    ));
  }
}