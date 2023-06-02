import 'package:flutter/material.dart';

class Emptycart extends StatelessWidget {
  const Emptycart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'images/empty.png',
        width: 400, // adjust the size to fit your design
        height: 400,
      ),
    );
  }
}
