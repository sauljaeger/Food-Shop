import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Function()? onTap;
  SignIn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green[700]
        ),
        child: Center(
          child: Text("Sign in", style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
