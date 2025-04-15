import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/firebase_options.dart';
import 'package:food_shop/models/cart-model.dart';
import 'package:food_shop/pages/auth_page.dart';
import 'package:food_shop/pages/intropage.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
