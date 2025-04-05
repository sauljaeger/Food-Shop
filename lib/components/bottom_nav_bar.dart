import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class bottomBar extends StatelessWidget {
  void Function(int)? onTabChange;
  bottomBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          color: Colors.grey,
          activeColor: Colors.green,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.white,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
        GButton(icon: Icons.home),

        GButton(icon: Icons.shopping_bag_rounded)
      ]),
    );
  }
}
