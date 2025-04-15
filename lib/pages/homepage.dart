import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/components/bottom_nav_bar.dart';
import 'package:food_shop/models/food.dart';
import 'package:food_shop/pages/cart.dart';
import 'package:food_shop/pages/intropage.dart';
import 'package:food_shop/pages/shop.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    shop(),
    Cart(),
  ];

  final user = FirebaseAuth.instance.currentUser!;
  //sign out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Colors.black,
          );
        }),
        actions: [
          IconButton(
              onPressed: signUserOut,
              icon: Icon(
                Icons.login,
                color: Colors.black,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.green[500],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo
            Column(
              children: [
                DrawerHeader(child: Image.asset('assets/fries.png')),
                const Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'HOME',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const ListTile(
                    leading: Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      'CART',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Intropage())),
              child: const Padding(
                //wrapping the intial parts in another column and spacebtw
                padding: const EdgeInsets.only(left: 8.0, bottom: 20),
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'LOGOUT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                ),
              ),
            )

            //other pages
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
