

import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orders/Model/category_model.dart';
import 'package:orders/const/const.dart';
import 'package:orders/screen/food_list.dart';
import 'package:orders/state/category_state.dart';
import 'package:orders/widgets/common/common_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required this.lst,
    required this.categoryStateController

  }) : super(key: key);

  final List<CategoryModel> lst;
  final CategoryStateController categoryStateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(
        child: LiveGrid(
          showItemInterval: Duration(milliseconds: 300),
          showItemDuration: Duration(milliseconds: 300),
          reAnimateOnVisibility: true,
          scrollDirection: Axis.vertical,
          itemCount: lst.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 1,mainAxisSpacing: 1),
          itemBuilder:animationItemBuilder((index)=>InkWell(onTap: (){
            categoryStateController.selectedCategory.value=lst[index];
            Get.to(()=>FoodListScreen());
          },
          child: Card(semanticContainer: true,clipBehavior: Clip.antiAliasWithSaveLayer,child: Stack(fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: lst[index].image,
                fit: BoxFit.cover,
                errorWidget: (context,url,err)=>
                    Center(child: Icon(Icons.image),),
                progressIndicatorBuilder: (context, url, dowloadProgress) =>
                    Center(child: CircularProgressIndicator(),
                    ),
              ),
              Container(color: Color(COLOR_OVERLAY),),
              Center(child: Text('${lst[index].name}',style: GoogleFonts.jetBrainsMono(color: Colors.white,fontSize: 18),),)
            ],),) ,
          )),

        ),
      ),
      ],
    );
  }
}