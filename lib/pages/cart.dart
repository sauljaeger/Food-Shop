import 'package:flutter/material.dart';
import 'package:food_shop/components/carti_tem.dart';
import 'package:food_shop/models/food.dart';
import 'package:provider/provider.dart';
import '../models/cart-model.dart';


class Cart extends StatelessWidget {
  //Food food;
  const Cart({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 15, top: 8),
          child: const Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
        ),

        const SizedBox(height: 25,),

        Expanded(child: ListView.builder(
          itemCount: value.getUserCart().length,
            itemBuilder: (context, index) {
          //get individual food
          Food individualFood = value.getUserCart()[index];



          return CartItem(food: individualFood);
        }))
      ],
    ));
  }

}
