import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_shop/components/google_login_tile.dart';
import 'package:food_shop/components/image_box.dart';
import 'package:food_shop/components/sign_in.dart';
import 'package:food_shop/components/sign_up.dart';
import 'package:food_shop/components/text_field.dart';

class Registerpage extends StatefulWidget {
  final Function()? onTap;
  const Registerpage({super.key, required this.onTap});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

   void signUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      }
      else {
        return showErrorMessage("passwords don't match");
        Navigator.pop(context);
      }
    }
    on FirebaseAuthException catch (e){
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }
  void showErrorMessage(String message){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(message,style: TextStyle(
              color: Colors.white
          ),),
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
                  height: 15,
                ),

                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),
                const SizedBox(
                  height: 15,
                ),

                MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obscureText: true),
                const SizedBox(
                  height: 15,
                ),


                const SizedBox(
                  height: 25,
                ),
                SignUp(
                  onTap: signUserUp,
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
                    Text("Already a user?", style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold
                    ),),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text("Login here", style: TextStyle(
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
