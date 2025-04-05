import 'package:flutter/material.dart';
import 'package:food_shop/models/food.dart';
import 'package:food_shop/models/cart-model.dart';
import 'package:provider/provider.dart';


class foodtile extends StatelessWidget {
  Food food;
  void Function()? onTap;// needed remember when creating onTap
  foodtile({super.key, required this.food, required this.onTap});//this too



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //picture of food
            ClipRect(
              child: Image.asset(food.imagePath,height: 150, width: 150,),
            ),

            //name

            // button to add to cart
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        food.price,
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),

                  //plus button
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: const Icon(Icons.add)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
