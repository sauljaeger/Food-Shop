import 'package:flutter/material.dart';
import 'package:food_shop/components/google_login_tile.dart';
import 'package:food_shop/components/image_box.dart';
import 'package:food_shop/components/sign_in.dart';
import 'package:food_shop/components/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.greenAccent,
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            //image
            ImageBox(),

            //
            Text(
              "Welcome to the shop",
              style: TextStyle(
                  color: Colors.green.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 25,
            ),

            //textfield

            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),

            const SizedBox(
              height: 25,
            ),

            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.green[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SignIn(
              onTap: signUserIn,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Row(children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[700],
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Or Continue with ",
                    style: TextStyle(color: Colors.green[400]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[700],
                    thickness: 0.5,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleLoginTile(

                  imagePath: 'assets/google.png',
                ),

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a Registered?", style: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register here", style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold
                  ),),
                ),

              ],
            ),
          ],
        )),
      ),
    );
  }
}
