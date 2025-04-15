import 'package:flutter/material.dart';

class GoogleLoginTile extends StatelessWidget {
  final String imagePath;
  const GoogleLoginTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade100,
        ),
        child: Image.asset(imagePath, height: 40,),
      ),
    );
  }
}
