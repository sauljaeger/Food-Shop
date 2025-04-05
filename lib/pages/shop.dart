import 'package:flutter/material.dart';
import 'package:food_shop/components/foodtile.dart';
import 'package:food_shop/models/cart-model.dart';
import 'package:food_shop/models/food.dart';
import 'package:provider/provider.dart';

class shop extends StatefulWidget {
  const shop({super.key});

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  void addFoodToCart(Food food) {
    Provider.of<CartModel>(context, listen: false).addItemToCart(food);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Successfully added to cart"),
        content: Text("Check your cart"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
        builder: (context, value, child) => Column(
              children: [
                //searchbar
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green[100],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: const Text("Search"),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        //gets all the food
                        Food food = value.getFoodList()[index];
                        return foodtile(
                          onTap: () => addFoodToCart(food),
                          food: food,
                        );
                      }),
                )

                //
              ],
            ));
  }
}
