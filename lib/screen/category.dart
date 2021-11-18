import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orders/Model/category_model.dart';
import 'package:orders/state/category_state.dart';
import 'package:orders/state/main_state.dart';
import 'package:orders/view-model/category_vm/category_viewmodel_imp.dart';
import 'package:orders/widgets/category/category_list_widget.dart';
import 'package:orders/widgets/common/appbar_with_cart_widget.dart';



class CategoryScreen extends StatelessWidget {
  final viewModel= CategoryViewModelImp();
  final MainStateController _mainStateController =Get.find();
  CategoryStateController categoryStateController=Get.put(CategoryStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithCartButton(
          title: '${_mainStateController.selectedRestaurant.value.name}',),
        body:FutureBuilder(
          future: viewModel.displayCategoryByRestaurantId(
              _mainStateController.selectedRestaurant.value.restaurantId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator(),);
            else {
              var lst = snapshot.data as List <CategoryModel>;
              return Container(
                margin: const EdgeInsets.only(top: 10),
                child: CategoryListWidget(lst:lst,categoryStateController: categoryStateController,),
              );
            }
          },

        ));
  }
}