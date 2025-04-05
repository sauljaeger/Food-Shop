import 'package:flutter/material.dart';
import 'package:food_shop/models/cart-model.dart';
import 'package:food_shop/pages/intropage.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(const foodApp());
}
class foodApp extends StatelessWidget {
  const foodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CartModel(),
    builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Intropage(),
    ),
    );
  }
}
