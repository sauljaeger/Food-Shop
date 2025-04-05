import 'package:flutter/cupertino.dart';
import 'package:food_shop/models/food.dart';

class CartModel extends ChangeNotifier{
  //list of food for sale
  List<Food> foodShop = [
    Food(name: "Bratwurst", price: '11.99', imagePath: 'assets/bratwurst.png'),
    Food(name: "Burger", price: '5.19', imagePath: 'assets/burger.png'),
    Food(name: "dumplings", price: '15.00', imagePath: 'assets/dumplings.png'),
    Food(name: "Fries", price: '4.19', imagePath: 'assets/fries.png'),
    Food(name: "Onigiri", price: '12.00', imagePath: 'assets/onigiri.png'),
    Food(name: "pizza", price: '20.00', imagePath: 'assets/pizza.png'),
    Food(name: "ramen", price: '13.00', imagePath: 'assets/ramen.png'),
    Food(name: "sushi", price: '13.00', imagePath: 'assets/sushi.png'),
  ];
  //list of items in users cart
  List<Food> userCart = [];

  //get list of food for sale
  List<Food> getFoodList(){
    return foodShop;
  }
  //get cart
  List<Food> getUserCart(){
    return userCart;
  }
  //add to cart
  void addItemToCart(Food food){
    userCart.add(food);
    notifyListeners();
  }

  //remove from cart
  void removeItem(Food food){
    userCart.remove(food);
    notifyListeners();
  }

}
