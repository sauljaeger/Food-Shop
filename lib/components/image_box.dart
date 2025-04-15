import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 200,

      child: Column(
        children: [
          Center(
            child: Image.asset('assets/thaai.png'),
          )
        ],
      ),
    );
  }
}
