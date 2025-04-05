import 'package:flutter/material.dart';
import 'package:food_shop/models/cart-model.dart';
import 'package:food_shop/models/food.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Food food;
  CartItem({super.key, required this.food});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  //remove item from cart
  void removeItemFromCart(){
    Provider.of<CartModel>(context, listen: false).removeItem(widget.food);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Image.asset(widget.food.imagePath),
          title: Text(widget.food.name),
          subtitle: Text(widget.food.price),
          trailing: IconButton(
              onPressed: removeItemFromCart, icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}
